import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/SmartTourContainer.dart';
import 'package:myapp/model/TappaModel.dart';
import 'package:myapp/scene/navbar.dart';
import 'package:myapp/service/ApiGeofencing.dart';
import 'package:myapp/service/ApiTappaService.dart';
import 'package:myapp/service/ApiTourService.dart';
import 'package:myapp/service/SecureStorageService.dart';
import 'package:myapp/scene/geof1.dart';

class SmartTourScene extends StatefulWidget {
  final int tourId;
  final String stato;
  const SmartTourScene({Key? key, required this.tourId,required this.stato}) : super(key: key);

  @override
  _SmartTourSceneState createState() => _SmartTourSceneState(this.tourId, this.stato);
}

class _SmartTourSceneState extends State<SmartTourScene> {
  int numberOfDays = 0;
  List<TappaModel> tappeList = [];
  List<String> attractionTitles = [];
  List<String> attractionImages = [];
  List<String> attractionDescriptions = [];
  Timer? _timer;
  int tourId;
  String stato;
  _SmartTourSceneState(this.tourId, this.stato);
  int? idTappa;
  @override
  void initState() {
    super.initState();
    loadTour();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      print("Sto eseguendo");
      String? result = await ApiGeofencing().checkNearestTappa(tourId);
      if (result != "null") {
        idTappa=int.parse(result);
        String? s = await fetchAndHandleTappaById(int.parse(result));
        if (s != null) {
          _showDialog(s);
        }
      }
    });
  }

  void _geofInCorso(){
    if(stato=='CORSO' && tappeList.isNotEmpty){
        _showDialogCorso();
    }
  }

  void _showDialogCorso() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Vuoi riprendere il tour?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startTimer();
                },
              child: Text("Riattiva geofencing"),
            ),
            TextButton(
              onPressed: () {
                // Azione quando si preme Rifiuta
                Navigator.of(context).pop();
              },
              child: Text("Rifiuta"),
            ),
          ],
        );
      },
    );
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _showDialog(String tappaName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Vuoi avviare il tour guidato per il $tappaName?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _stopTimer();
                Navigator.push(context, MaterialPageRoute(builder: (context) => GeofScene(numb: 1, tappa:idTappa!, tour:tourId)),);
              },
              child: Text("Accetta"),
            ),
            TextButton(
              onPressed: () {
                // Azione quando si preme Rifiuta
                Navigator.of(context).pop();
              },
              child: Text("Rifiuta"),
            ),
          ],
        );
      },
    );
  }

  loadTour() {
    ApiTappaService().getTappeNotComplete(widget.tourId).then((tappaModelList) {
      if (tappaModelList != null) {
        setState(() {
          tappeList = tappaModelList;
          numberOfDays = (tappaModelList.length / 4).ceil();
          if (numberOfDays == 0) numberOfDays++;
          for (TappaModel tappa in tappaModelList) {
            attractionTitles.add(tappa.nome);
            if(tappa.descrizione.length>80)
              tappa.descrizione = tappa.descrizione.substring(0,80)+"...";
            attractionDescriptions.add(tappa.descrizione);
            attractionImages.add(tappa.foto);
          }
        });
         _geofInCorso();
      }
    });
  }

  Future<String?> fetchAndHandleTappaById(int id) async {
    try {
      TappaModel? tappa = await ApiTappaService().getTappaById(id);
      if (tappa != null) {
        print("Tappa trovata: ${tappa.nome}");
        return tappa.nome;
      } else {
        print("Nessuna tappa trovata con id $id");
        return null;
      }
    } catch (e) {
      print("Si è verificato un errore durante il recupero della tappa: $e");
      return null;
    }
  }

  

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double scale = MediaQuery.of(context).size.width / baseWidth;
    double textScaleFactor = scale * 0.97;

    double marginValue = 0.0;
    if (stato == 'CORSO') {
      marginValue = 21 * scale;
    } else if (stato == 'ARCHIVIATO') {
      marginValue = 67 * scale;
    } else {
      marginValue = 75 * scale;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smart Tour',
          style: TextStyle(
            fontSize: 20 * textScaleFactor,
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
              Navigator.pushNamed(context, '/mieitour');
            },
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 18 * scale, 0, 22 * scale),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          14.5 * scale, 0, 9 * scale, 16 * scale),
                      height: 180 * scale,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 22.5 * scale, 0),
                            width: 80 * scale,
                            height: 180 * scale,
                            child: Image.asset(
                              'assets/scene/images/progetto-senza-titolo-2-1-2hA.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: 22 * scale),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xffededed),
                                      borderRadius:
                                          BorderRadius.circular(26 * scale),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8 * scale),
                                      child: Text(
                                        'Ecco a te il tuo personalissimo SmartTour, adesso non ti resta che visitare la mia fantastica terra',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ptSans(
                                          fontSize: 16 * textScaleFactor,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2925,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20 * scale),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: marginValue),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4 * scale,
                                        horizontal: 9 * scale),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(15 * scale),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(0, 4 * scale),
                                          blurRadius: 2 * scale,
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        if (stato == "CORSO") {
                                          ApiTourService()
                                              .updateTourState(
                                                  tourId, "ARCHIVIATO")
                                              .then((response) {
                                            if (response != null) {
                                              Navigator.pushNamed(context, '/mieitour');
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Tour archiviato!"),
                                                    content: Text(
                                                        "Il tour selezionato è stato archiviato"),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("Chiudi"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          });
                                        } else if (stato == "ARCHIVIATO") {
                                          ApiTourService()
                                              .deleteTour(tourId)
                                              .then((response) {
                                            if (response != null) {
                                              Navigator.pushNamed(context, '/mieitour');
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Tour cancellato!"),
                                                    content: Text(
                                                        "Il tour selezionato è stato cancellato"),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("Chiudi"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          });
                                        } else {
                                          //stato == "PROGRAMMA"
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Tour avviato!"),
                                                content: Text(
                                                    "Recati in un luogo d'interesse per visitarlo"),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Chiudi"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          // Inizia il timer quando viene premuto il pulsante "Avvia tour"
                                          _startTimer();
                                          ApiTourService()
                                              .updateTourState(tourId, "CORSO");
                                        }
                                      },
                                      child: createAssistantMessageByState(
                                          stato, scale, textScaleFactor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (tappeList.isNotEmpty)
                SmartTourContainer(
                  itemCount: tappeList.length,
                  dayTitle: "Giorno 1",
                  attractionTitles: attractionTitles,
                  attractionImages: attractionImages,
                  attractionDescriptions: attractionDescriptions,
                  scale: scale,
                  textScaleFactor: textScaleFactor,
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBarScene(),
    );
  }

  Widget createAssistantMessageByState(
      String stato, double scale, double textScaleFactor) {
    if (stato == 'CORSO') {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/scene/images/icone-archivia.png',
          width: 14 * scale,
          height: 16 * scale,
        ),
        SizedBox(width: 7 * scale),
        Expanded(
          child: Text(
            'Termina e archivia il tour',
            style: GoogleFonts.ptSans(
              fontSize: 16 * textScaleFactor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              color: Color(0xff000000),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]);
    } else if (stato == 'ARCHIVIATO') {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/scene/images/icone-bqp.png',
          width: 14 * scale,
          height: 16 * scale,
        ),
        SizedBox(width: 7 * scale),
        Expanded(
          child: Text(
            'Elimina tour',
            style: GoogleFonts.ptSans(
              fontSize: 16 * textScaleFactor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              color: Color(0xff000000),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]);
    } else {
      //stato == 'PROGRAMMA'
      return Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/scene/images/icone-69r.png',
          width: 14 * scale,
          height: 16 * scale,
        ),
        SizedBox(width: 7 * scale),
        Expanded(
          child: Text(
            'Avvia tour',
            style: GoogleFonts.ptSans(
              fontSize: 16 * textScaleFactor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              color: Color(0xff000000),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]);
    }
  }
}
