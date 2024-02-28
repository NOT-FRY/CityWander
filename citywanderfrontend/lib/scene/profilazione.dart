// ??? import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/service/ApiUserService.dart';

class ProfilazioneScene extends StatefulWidget {
  @override
  _ProfilazioneSceneState createState() => _ProfilazioneSceneState();
}

class _ProfilazioneSceneState extends State<ProfilazioneScene> {
  TextEditingController soggiornoController = TextEditingController();
  TextEditingController alloggioController = TextEditingController();

  @override
  void dispose() {
    soggiornoController.dispose();
    alloggioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profilazione',
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
              Navigator.pushNamed(context, '/profilo');
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
                        'Completa la tua profilazione per generare nuovi tour',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ptSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff00372c),
                        ),
                      ),
                    ),
                    buildTextField(
                      "Durata soggiorno (Numero)",
                      soggiornoController,
                      hintText: "Per quanti giorni resterai a Salerno?",
                      isNumeric: true,
                    ),
                    buildTextField(
                      "Alloggio",
                      alloggioController,
                      hintText: "Inserisci la via dove alloggerai",
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          saveProfile(context);
                        },
                        child: Text(
                          'Salva',
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

  void saveProfile(BuildContext context) {
    ApiUserService().geocoding(alloggioController.text).then((address) {
      if (address != null) {
        ApiUserService().updateUserProfiling(int.parse(soggiornoController.text),alloggioController.text,address).then((value) {
          if (value == null || !value){
           Fluttertoast.showToast(
            msg: "Errore nel salvataggio del profilo",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0); 
            Navigator.pushNamed(context, '/profilo');
          }else{
            Fluttertoast.showToast(
            msg: "Profilo salvato correttamente",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0); 
            Navigator.pushNamed(context, '/profilo');
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: "Indirizzo inserito non valido, inserisci un indirizzo della Città di Salerno",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);                             
      }
    });
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
