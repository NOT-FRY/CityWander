import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/scene/navbar.dart';
import 'package:myapp/service/ApiTourService.dart';
import 'package:myapp/service/ApiUserService.dart';
import 'package:myapp/service/SecureStorageService.dart';

class AssistenteScene extends StatefulWidget {
  @override
  _AssistenteSceneState createState() => _AssistenteSceneState();
}

class _AssistenteSceneState extends State<AssistenteScene> {
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  double opacity4 = 0.0;
  double opacity5 = 0.0;
  double opacity6 = 0.0;
  double opacity7 = 0.0;

  bool areaTourPressed = false;

  @override
  void initState() {
    super.initState();
    _animateOpacity();
  }

  void _animateOpacity() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (!mounted) return;
      setState(() => opacity1 = 1.0);
      Future.delayed(Duration(milliseconds: 500), () {
        if (!mounted) return;
        setState(() => opacity2 = 1.0);
        Future.delayed(Duration(milliseconds: 500), () {
          if (!mounted) return;
          setState(() => opacity3 = 1.0);
          Future.delayed(Duration(milliseconds: 500), () {
            if (!mounted) return;
            setState(() => opacity4 = 1.0);
            Future.delayed(Duration(milliseconds: 500), () {
              if (!mounted) return;
              setState(() => opacity5 = 1.0);
              Future.delayed(Duration(milliseconds: 500), () {
                if (!mounted) return;
                setState(() => opacity6 = 1.0);
                Future.delayed(Duration(milliseconds: 500), () {
                  if (!mounted) return;
                  setState(() => opacity7 = 1.0);
                });
              });
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Assistente',
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
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: Container(
        color: Color(0xfff5f5f5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xffc0c0c0),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/scene/images/pricipe105x105-1-Czx.png',
                      fit: BoxFit.cover, width: 60, height: 60),
                  Text('Principe Arechi',
                      style: GoogleFonts.ptSans(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            if (!areaTourPressed) ...[
              AnimatedOpacity(
                opacity: opacity1,
                duration: Duration(seconds: 1),
                child: _buildMessageContainer('Ciao, sono qui per aiutarti'),
              ),
              AnimatedOpacity(
                opacity: opacity2,
                duration: Duration(seconds: 1),
                child: _buildMessageContainer('Ti lascio dei suggerimenti'),
              ),
              AnimatedOpacity(
                opacity: opacity3,
                duration: Duration(seconds: 1),
                child: _buildMessageContainer(
                    'Seleziona l\'attività che preferisci'),
              ),
              AnimatedOpacity(
                opacity: opacity4,
                duration: Duration(seconds: 1),
                child: _buildButton('Area tour', _onPressedAreaTour),
              ),
              AnimatedOpacity(
                opacity: opacity5,
                duration: Duration(seconds: 1),
                child: _buildButton('Locali', _onPressedLocali),
              ),
              AnimatedOpacity(
                opacity: opacity6,
                duration: Duration(seconds: 1),
                child: _buildButton('Premi', _onPressedPremi),
              ),
              AnimatedOpacity(
                opacity: opacity7,
                duration: Duration(seconds: 1),
                child: _buildButton('Visualizza profilo', _onPressedProfilo),
              ),
            ] else ...[
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(seconds: 1),
                child: _buildMessageContainer('Benvenuto nell\'area tour'),
              ),
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(seconds: 1),
                child: _buildMessageContainer(
                    'Seleziona l\'attività che preferisci'),
              ),
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(seconds: 1),
                child: _buildButton('Genera nuovo tour', _onPressedGeneraTour),
              ),
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(seconds: 1),
                child: _buildButton('Lista dei tour generati', _onPressedTour),
              ),
              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(seconds: 1),
                child: _buildButton('Visualizza mappa', _onPressedMap),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: NavBarScene(),
    );
  }

  Widget _buildMessageContainer(String message) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, top: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: Text(
        message,
        style: GoogleFonts.ptSans(fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildButton(String buttonText, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, top: 8.0),
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: GoogleFonts.ptSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff363636),
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  void _onPressedAreaTour() {
    setState(() {
      areaTourPressed = true;
    });
  }

  void _onPressedLocali() {
    Navigator.pushNamed(context, '/locali');
  }

  void _onPressedGeneraTour() async{
    //TODO qualcosa che mostri che si sta generando, tipo il CircularProgressIndicator();
    SecureStorageService.storage.read(key: "EMAIL").then((email) {
        ApiUserService().findUserByEmail(email!).then((userModel) {
          if(userModel==null || userModel.coordinateAlloggio==null || userModel.coordinateAlloggio!.isEmpty){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Informazioni aggiuntive necessarie"),
                    content: Text(
                        "Per favore, completa la profilazione prima di generare il tour."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Annulla"),
                      ),
                      TextButton(
                        onPressed: () {
                          _onPressedProfilo();
                        },
                        child: Text("Apri profilazione"),
                      ),
                    ],
                  );
                });
          }else{
            ApiTourService().generateTour(email!).then((isGenerated){
              if(isGenerated!=null && isGenerated){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Tour generato"),
                        content: Text(
                            "Il tour è stato generato secondo le tue preferenze."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Indietro"),
                          ),
                          TextButton(
                            onPressed: () {
                              _onPressedTour();
                            },
                            child: Text("Vai ai tuoi tour"),
                          ),
                        ],
                      );
                    });
              }else{
                Fluttertoast.showToast(
                  msg: "Errore nella generazione del tour",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              }
          });
          }
        });


    });
    
  }
  void _onPressedTour() {
    Navigator.pushNamed(context, '/mieitour');
  }

  void _onPressedMap() {
    Navigator.pushNamed(context, '/tour');
  }

  void _onPressedPremi() {
    Navigator.pushNamed(context, '/wallet');
  }

  void _onPressedProfilo() {
    Navigator.pushNamed(context, '/profilo');
  }
}
