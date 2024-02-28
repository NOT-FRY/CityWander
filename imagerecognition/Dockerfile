# start by pulling the python image
FROM python:3.9

# switch working directory
WORKDIR /app

# copy the requirements file into the image
# COPY ./requirements.txt /app
# RUN pip install -r requirements.txt non funziona...

# install the dependencies and packages in the requirements file
RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install tensorflow-directml-plugin
RUN pip install livelossplot
RUN pip install Ipython
RUN pip install scipy
RUN pip install opencv-python
RUN pip install -U scikit-learn
RUN pip install seaborn
RUN pip install imagecodecs
RUN pip install pillow
RUN pip install pillow_heif
RUN pip install flask
RUN pip install flask_cors

COPY . .

EXPOSE 5000

ENV FLASK_APP=app.py

CMD ["flask", "run", "--host", "0.0.0.0"]