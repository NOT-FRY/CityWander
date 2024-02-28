import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/scene/info-locale.dart';
import 'package:myapp/scene/navbar.dart';
import 'package:myapp/service/ApiImageRecognitionService.dart';
import 'package:myapp/service/ApiRestaurantService.dart';
import 'package:myapp/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class ImgRecognitionScene extends StatefulWidget {
  @override
  _ImgRecognitionSceneState createState() => _ImgRecognitionSceneState();
}

class _ImgRecognitionSceneState extends State<ImgRecognitionScene> {
  bool isCameraInitialized = false;
  File? _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    requestCameraPermission().then((_) {
      setState(() {});
    });
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      showPermissionDialog();
      isCameraInitialized = false;
    } else if (status.isGranted) {
      isCameraInitialized = true;
    }
  }

  void showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Permessi richiesti"),
          content: Text(
              "L'app richiede l'accesso alla fotocamera per poter funzionare correttamente."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text("Annulla"),
            ),
            TextButton(
              onPressed: () {
                openAppSettings();
              },
              child: Text("Apri impostazioni"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    // if (_controller == null || !_controller!.value.isInitialized) {
    //   return Text("Errore: Impossibile inizializzare la fotocamera");
    // }

    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final bottomNavBarHeight = kBottomNavigationBarHeight;

    final cameraHeight = screenHeight - appBarHeight - bottomNavBarHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 390;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image recognition',
          style: TextStyle(
            fontSize: 20 * ffem,
            fontWeight: FontWeight.w700,
            color: Color(0xff00372c),
          ),
        ),
        backgroundColor: Color(0xffd9d9d9),
        leading: Container(
          margin: EdgeInsets.all(5.0),
          child: IconButton(
            icon: Image.asset(
              'assets/scene/images/icone-4VS.png',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/scene/images/image-recognition-bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
// White fading rectangle
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenHeight * 0.38,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  stops: [0.3, 1],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Vuoi scoprire più informazioni su un locale?\nAvvia la fotocamera qui sotto e scatta una foto all’insegna.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff00372c),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _takePicture();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image.asset(
                          'assets/scene/images/fotocamera_imgrecognition3.png',
                          width: 65,
                          height: 65,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          if (_loading) Center(child: CircularProgressIndicator())
        ],
      ),
      bottomNavigationBar: NavBarScene(),
    );
  }

  Future<void> _takePicture() async {
    try {
      final PickedFile? imagePicked = //Versione vecchia, crasha un po' di meno
          await ImagePicker().getImage(source: ImageSource.camera);

      setState(() {
        _loading = true;
      });

      if (imagePicked != null) {
        _image = File(imagePicked.path);

        ApiImageRecognitionService()
            .sendImageToServer(_image!)
            .then((imageUploaded) {
          if (imageUploaded != null) {
            ApiImageRecognitionService()
                .imageRecognition(imageUploaded)
                .then((recognizedImage) {
              if (recognizedImage != null) {
                ApiRestaurantService()
                    .findRistoranteByName(recognizedImage)
                    .then((ristorante) {
                  setState(() {
                    _loading = false;
                  });
                  if (ristorante != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => LocaleScene(
                            image:
                                HelperService.getImageFromWeb(ristorante.foto),
                            title: ristorante.nome!,
                            description: ristorante.descrizioneCompleta!,
                            address: ristorante.indirizzo!))));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Server error: Ristorante non riconosciuto",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                });
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Ristorante non riconosciuto"),
                        content: Text(
                            "Per favore, prova a scattare un'altra foto oppure vai a tutti i locali."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Scatta un'altra foto"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/locali');
                            },
                            child: Text("Tutti i locali"),
                          ),
                        ],
                      );
                    });
                setState(() {
                  _loading = false;
                });
              }
            });
            setState(() {
              _loading = false;
            });
          } else {
            Fluttertoast.showToast(
                msg: "Server error: image not uploaded",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            setState(() {
              _loading = false;
            });
          }
        });
      }
    } catch (exception) {
      log(exception.toString());
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(
          msg: exception.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
