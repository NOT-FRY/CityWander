import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrazioneLocaleScene extends StatefulWidget {
  @override
  _RegistrazioneLocaleSceneState createState() =>
      _RegistrazioneLocaleSceneState();
}

class _RegistrazioneLocaleSceneState extends State<RegistrazioneLocaleScene> {
  TextEditingController nomeLocaleController = TextEditingController();
  TextEditingController descrizioneLocaleController = TextEditingController();
  TextEditingController indirizzoController = TextEditingController();
  TextEditingController orarioController = TextEditingController();
  List<File?> _selectedImages = [];

  @override
  void dispose() {
    nomeLocaleController.dispose();
    descrizioneLocaleController.dispose();
    indirizzoController.dispose();
    orarioController.dispose();
    super.dispose();
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile? image = await _picker.getImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        if (_selectedImages.length < 6) {
          _selectedImages.add(File(image.path));
        } else {
          _showMaxImageAlert();
        }
      });
    }
  }

  void _showMaxImageAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Limite di immagini raggiunto"),
          content: Text("È possibile inserire al massimo 6 foto."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registra un nuovo locale',
          style: TextStyle(
            fontSize: 20,
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
              Navigator.pushNamed(context, '/esercente');
            },
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                      child: Text(
                        'Inserisci le informazioni per un nuovo locale',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ptSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff00372c),
                        ),
                      ),
                    ),
                    buildTextField(
                      "Nome locale",
                      nomeLocaleController,
                      hintText: "Nome del locale",
                      isNumeric: true,
                    ),
                    buildTextField(
                      "Descrizione locale",
                      descrizioneLocaleController,
                      hintText: "Inserisci una descrizione del locale",
                    ),
                    Text(
                      'Immagini locale',
                      style: GoogleFonts.ptSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff00372c),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        for (int i = 0; i < _selectedImages.length; i++)
                          Expanded(
                            child: Image.file(_selectedImages[i]!),
                          ),
                      ],
                    ),
                    ElevatedButton(
                          onPressed: () {
                            if (_selectedImages.length < 6) {
                              _getImage();
                            } else {
                              _showMaxImageAlert();
                            }
                          },
                      child: Text(
                            "Carica Immagine",
                            style: TextStyle(fontSize: 18),
                          ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffffa723),
                          onPrimary: Color(0xff00372c),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                    ),
                    buildTextField(
                      "Indirizzo",
                      indirizzoController,
                      hintText: "Inserisci l'indirizzo del locale",
                    ),
                    buildTextField(
                      "Orario",
                      orarioController,
                      hintText: "Inserisci l'orario di apertura del locale",
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/esercente');
                        },
                        child: Text(
                          'Richiedi registrazione ristorante',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffa723),
                          onPrimary: Color(0xff00372c),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {String? hintText, bool isNumeric = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.ptSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff00372c),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
            inputFormatters:
                isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
          ),
        ],
      ),
    );
  }
}
