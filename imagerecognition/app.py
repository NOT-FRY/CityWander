import os
from tensorflow.keras.models import load_model
from tensorflow.keras.layers import Dense
from tensorflow.keras.preprocessing import image

import numpy as np
from sklearn.metrics import precision_score, recall_score, f1_score
from PIL import Image
import pillow_heif
from keras.preprocessing.image import ImageDataGenerator
from keras.callbacks import ModelCheckpoint, EarlyStopping
from keras.layers import Dense, Dropout
from keras.models import Model
from keras.optimizers import Adam
from keras.applications.resnet import preprocess_input
from sklearn.metrics import accuracy_score
import pickle
from keras.applications import ResNet50
from keras.layers import GlobalAveragePooling2D

from flask import Flask
from flask import jsonify
from flask import request
from flask_cors import CORS
from werkzeug.utils import secure_filename

import logging

logging.basicConfig(filename='record.log', level=logging.DEBUG)


app = Flask(__name__)
CORS(app)

UPLOADED_IMAGES_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}
THRESHOLD = 0.6

app.config['MAX_CONTENT_LENGTH'] = 16 * 1000 * 1000 #max 16MB per file

@app.route('/imageRecognition',methods=['GET'])
def imageRecognition():

    imageName = request.args.get('imageName')
    full_path_to_file = os.path.join(app.root_path, UPLOADED_IMAGES_FOLDER, imageName)
    print(full_path_to_file)

    if(not os.path.exists(full_path_to_file)):
        app.logger.info(f'image not found, path:{full_path_to_file}')
        print(f'image not found, path:{full_path_to_file}')
        return jsonify({})

    recognizedImage = operate(full_path_to_file)

    os.remove(full_path_to_file)

    return jsonify({
        'recognizedImage': recognizedImage
    })

@app.route('/uploadImage', methods=['POST'])
def upload_and_display():
    if request.method == 'POST':
        # Ricevi l'immagine dal client
        if 'image' not in request.files:
            return 'Nessun file nell\'istanza della richiesta', 400

        file = request.files['image']

        if file.filename == '':
            return 'Nessun file selezionato', 400

        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            filepath = os.path.join(app.root_path, UPLOADED_IMAGES_FOLDER, filename)
            file.save(filepath)
            return jsonify({
                'filename': filename
            })
        else:
            return 'File not allowed', 400


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def create_model(input_shape, n_classes, optimizer='rmsprop', fine_tune=0):

    # Pretrained convolutional layers are loaded using the Imagenet weights.
    # Include_top is set to False, in order to exclude the model's fully-connected layers.
    conv_base = ResNet50(include_top=False,
                         weights='imagenet',
                         input_shape=input_shape)

    # Defines how many layers to freeze during training.
    # Layers in the convolutional base are switched from trainable to non-trainable
    # depending on the size of the fine-tuning parameter.
    if fine_tune > 0:
        for layer in conv_base.layers[:-fine_tune]:
            layer.trainable = False
    else:
        for layer in conv_base.layers:
            layer.trainable = False

    # Create a new 'top' of the model (i.e. fully-connected layers).
    # This is 'bootstrapping' a new top_model onto the pretrained layers.
    top_model = conv_base.output
    top_model = GlobalAveragePooling2D()(top_model)
    top_model = Dense(1024, activation='relu')(top_model)
    top_model = Dropout(0.5)(top_model)
    output_layer = Dense(n_classes, activation='softmax')(top_model)

    # Group the convolutional base and new fully-connected layers into a Model object.
    model = Model(inputs=conv_base.input, outputs=output_layer)

    # Compiles the model for training.
    model.compile(optimizer=optimizer,
                  loss='categorical_crossentropy',
                  metrics=['accuracy'])

    return model


def generate_model():
    dataset_dir = os.path.join(app.root_path, 'dataset')
    num_classes = os.listdir(dataset_dir)
    img_height = 224
    img_width = 224
    batch_size = 64
    epochs = 100

    # Creazione del generatore di dati per il training con data augmentation
    train_datagen = ImageDataGenerator(
        rotation_range=90,
        brightness_range=[0.1, 0.7],
        width_shift_range=0.5,
        height_shift_range=0.5,
        horizontal_flip=True,
        vertical_flip=True,
        validation_split=0.15,
        preprocessing_function=preprocess_input
    )

    test_generator = ImageDataGenerator(preprocessing_function=preprocess_input)

    # Verifica se ci sono dati di training
    train_generator = train_datagen.flow_from_directory(
        dataset_dir,
        target_size=(img_height, img_width),
        batch_size=batch_size,
        class_mode='categorical',
        classes=num_classes,
        shuffle=True,
        seed=42,
        subset='training'  # Utilizza solo i dati di training
    )

    # Verifica se ci sono dati di validazione
    validation_generator = train_datagen.flow_from_directory(
        dataset_dir,
        target_size=(img_height, img_width),
        batch_size=batch_size,
        class_mode='categorical',
        classes=num_classes,
        shuffle=True,
        seed=42,
        subset='validation'  # Utilizza solo i dati di validazione
    )

    testgen = test_generator.flow_from_directory(
        dataset_dir,
        target_size=(img_height, img_width),
        class_mode=None,
        classes=num_classes,
        batch_size=1,
        shuffle=False,
        seed=42)

    input_shape = (img_height, img_width, 3)
    optim_1 = Adam(learning_rate=0.001)
    n_classes = len(num_classes)

    n_steps = train_generator.samples // batch_size
    n_val_steps = validation_generator.samples // batch_size
    n_epochs = epochs

    # First we'll train the model without Fine-tuning
    vgg_model = create_model(input_shape, n_classes, optim_1, fine_tune=0)

    # ModelCheckpoint callback - save best weights
    tl_checkpoint_1 = ModelCheckpoint(filepath=os.path.join(app.root_path, 'model', 'tl_model_v1.weights.best.h5'),
                                      save_best_only=True,
                                      verbose=1)

    # EarlyStopping
    early_stop = EarlyStopping(monitor='val_loss',
                               patience=10,
                               restore_best_weights=True,
                               mode='min')


    vgg_history = vgg_model.fit(train_generator,
                                batch_size=batch_size,
                                epochs=n_epochs,
                                validation_data=validation_generator,
                                steps_per_epoch=n_steps,
                                validation_steps=n_val_steps,
                                callbacks=[tl_checkpoint_1, early_stop],
                                verbose=1)

    # Generate predictions
    vgg_model.load_weights(os.path.join(app.root_path, 'model', 'tl_model_v1.weights.best.h5'))

    true_classes = testgen.classes
    class_indices = train_generator.class_indices
    class_indices = dict((v, k) for k, v in class_indices.items())


    vgg_preds = vgg_model.predict(testgen)
    vgg_pred_classes = np.argmax(vgg_preds, axis=1)

    vgg_acc = accuracy_score(true_classes, vgg_pred_classes)
    print("VGG16 Model Accuracy without Fine-Tuning: {:.2f}%".format(vgg_acc * 100))


    # Reset our image data generators
    train_generator.reset()
    validation_generator.reset()
    testgen.reset()

    # Use a smaller learning rate
    optim_2 = Adam(learning_rate=0.0001)

    # Re-compile the model, this time leaving the last 2 layers unfrozen for Fine-Tuning
    vgg_model_ft = create_model(input_shape, n_classes, optim_2, fine_tune=2)

    # Retrain model with fine-tuning
    vgg_ft_history = vgg_model_ft.fit(train_generator,
                                      batch_size=batch_size,
                                      epochs=n_epochs,
                                      validation_data=validation_generator,
                                      steps_per_epoch=n_steps,
                                      validation_steps=n_val_steps,
                                      callbacks=[tl_checkpoint_1, early_stop],
                                      verbose=1)

    # Generate predictions
    vgg_model_ft.load_weights(os.path.join(app.root_path, 'model', 'tl_model_v1.weights.best.h5'))  # initialize the best trained weights

    vgg_preds_ft = vgg_model_ft.predict(testgen)
    vgg_pred_classes_ft = np.argmax(vgg_preds_ft, axis=1)

    vgg_acc_ft = accuracy_score(true_classes, vgg_pred_classes_ft)
    print("VGG16 Model Accuracy with Fine-Tuning: {:.2f}%".format(vgg_acc_ft * 100))

    # Save class_indices to a file
    with open(os.path.join(app.root_path, 'model', 'class_indices.pkl'), 'wb') as file:
        pickle.dump(class_indices, file)

    return class_indices


def predict_restaurant(img_path, model, class_indices):
    # Carica e pre-processa l'immagine
    img = image.load_img(img_path, target_size=(224, 224))
    img_array = image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)
    img_array = preprocess_input(img_array)

    # Fai la previsione utilizzando il modello
    predictions = model.predict(img_array)
    print(predictions)

    # Ottieni l'indice della classe predetta
    predicted_class_index = np.argmax(predictions[0])


    punteggio_predizione = (predictions[0])[predicted_class_index]
    print("punteggio_predizione:"+str(punteggio_predizione))
    if punteggio_predizione < THRESHOLD:
        return None
    else:
        # Ottieni il nome della classe predetta utilizzando il dizionario class_indices
        predicted_restaurant = class_indices[predicted_class_index]
        return predicted_restaurant

def converti_heic_in_jpeg(cartella_input, cartella_output):
    # Verifica se la cartella di output esiste, altrimenti creala
    if not os.path.exists(cartella_output):
        os.makedirs(cartella_output)

    # Elenco dei file nella cartella di input
    files = os.listdir(cartella_input)

    for file in files:
        if file.lower().endswith(".heic"):
            # Costruisci il percorso completo dei file
            percorso_input = os.path.join(cartella_input, file)
            percorso_output = os.path.join(cartella_output, os.path.splitext(file)[0] + ".jpg")

            # Chiama la funzione di conversione
            converti_heic_in_jpeg_single(percorso_input, percorso_output)

def converti_heic_in_jpeg_single(heic_file_path, jpg_file_path):
    heif_file = pillow_heif.read_heif(heic_file_path)
    image = Image.frombytes(
        heif_file.mode,
        heif_file.size,
        heif_file.data,
        "raw",
    )
    image.save(jpg_file_path, format("jpeg"))


def operate(img_path):

    # Carica class_indices dal file
    with open(os.path.join(app.root_path, 'model', 'class_indices.pkl'), 'rb') as file:
        class_indices = pickle.load(file)

    # Carica il modello allenato
    model = load_model(os.path.join(app.root_path, 'model', 'tl_model_v1.weights.best.h5'))

    return predict_restaurant(img_path, model, class_indices)

if __name__ == '__main__':
    #Chiama la funzione per la generazione del modello
    #generate_model()

    #flask run --host=0.0.0.0 su windows
    app.run(host="0.0.0.0", port=5000)

