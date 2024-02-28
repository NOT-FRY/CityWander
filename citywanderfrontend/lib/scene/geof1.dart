import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/scene/navbar.dart';
import 'package:myapp/service/ApiGeofencing.dart';
import 'package:myapp/service/ApiTappaService.dart';
import 'package:myapp/service/ApiSezioni.dart';
import 'package:myapp/model/TappaModel.dart';
import 'package:myapp/model/SezioneModel.dart';
import 'package:myapp/service/SecureStorageService.dart';
import 'package:myapp/utils.dart';

class GeofScene extends StatefulWidget {
  final int numb;
  final int tappa;
  final int tour;
  GeofScene(
      {required this.numb,
      required this.tappa,
      required this.tour}); // Costruttore che accetta un parametro idTappa

  @override
  _GeofSceneState createState() => _GeofSceneState(
      numb: numb, tappa: tappa, tour:tour); // Passa il parametro al createState
}

class _GeofSceneState extends State<GeofScene> {
  final int numb;
  final int tappa;
  final int tour;
  _GeofSceneState({required this.numb, required this.tappa, required this.tour});
  final ApiTappaService apiService = ApiTappaService();
  final ApiSezioni apiSezioni = ApiSezioni();
  TappaModel? tappamod;
  SezioneModel? sezione;
  int? max = 0;

  @override
  void initState() {
    super.initState();
    print("Sono in init con numb: $numb e tappa: $tappa");
    _fetchTappaById(tappa);
    //num++;
    //_getSezione(5, num);
    //num++;
    //_getSezione(5, num);
    //num--;
    _getSezione(tappa, numb);
    _getMaxSezione(tappa);
  }

  Future<void> _fetchTappaById(int idTappa) async {
    try {
      final tappa = await apiService.getTappaById(idTappa);
      setState(() {
        print(tappa?.nome);
        this.tappamod = tappa;
      });
    } catch (e) {
      print('Errore durante il recupero della tappa: $e');
    }
  }

  Future<void> _getSezione(int idTappa, int num) async {
    try {
      final sezione = await apiSezioni.getSection(idTappa, num);
      setState(() {
        print("Sezione: $num");
        print(sezione?.titolo);
        this.sezione = sezione;
      });
    } catch (e) {
      print('Errore durante il recupero della tappa: $e');
    }
  }

  Future<void> _getMaxSezione(int idTappa) async {
    try {
      int? num = await apiSezioni.getNumSez(idTappa);
      setState(() {
        this.max = num;
        print("MAX: $max");
      });
    } catch (e) {
      print('Errore durante il recupero della tappa: $e');
    }
  }

  Future<void> _setTappaTourCompletata(int idTour, int idTappa) async {
    try {
      bool? check = await ApiTappaService().setTappaTourCompletata(idTour, idTappa);
      if(check!){
        print("Aggiornamento andato!");
      }else{
        print("Errore!");
      }
    } catch (e) {
      print('Errore endpoint: $e');
    }
  }

  Future<void> _addPointsToUser(String email, int points) async {
    try {
      bool? check = await ApiTappaService().addPointsToUser(email, points);
      if(check!){
        print("Aggiornamento andato!");
      }else{
        print("Errore!");
      }
    } catch (e) {
      print('Errore endpoint: $e');
    }
  }

  void _showFinishDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Conferma visita"),
          content: Text("Vuoi terminare la visita?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Annulla"),
            ),
            TextButton(
              onPressed: () async{
                String? email=await SecureStorageService.storage.read(key: "EMAIL");
                await _addPointsToUser(email!, 100);
                await _setTappaTourCompletata(tour, tappa);
                Navigator.pushNamed(context, '/wallet');
              },
              child: Text("Termina"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    double navBarHeight = 60.0;
    double availableHeight = screenHeight -
        appBarHeight -
        navBarHeight -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${tappamod?.nome}',
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
            icon: Image.asset('assets/scene/images/icone-4VS.png'),
            onPressed: () {
              Navigator.pushNamed(context, '/tour');
            },
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height:
            availableHeight, // Utilizza la variabile availableHeight per l'altezza fissa
        decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 15 * fem, 0 * fem, 0 * fem),
                        width: 390 * fem,
                        height: 670 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  11 * fem, 0 * fem, 11 * fem, 0 * fem),
                              width: double.infinity,
                              height: 170 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 61 * fem,
                                    height: 158 * fem,
                                    child: Image.asset(
                                      'assets/scene/images/progetto-senza-titolo-2-1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          5 * fem, 0 * fem, 5 * fem, 0 * fem),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffc6c6c6)),
                                        gradient: LinearGradient(
                                          begin: Alignment(0, -1),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0x5bf5f5f5),
                                            Color(0x5bf5f5f5)
                                          ],
                                          stops: [0, 1],
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(26 * fem),
                                          topRight: Radius.circular(26 * fem),
                                          bottomRight:
                                              Radius.circular(26 * fem),
                                          bottomLeft: Radius.circular(26 * fem),
                                        ),
                                      ),
                                      child: Center(
                                        // Aggiunto il widget Center qui
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center, // Centra il testo verticalmente
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                style: GoogleFonts.ptSans(
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2925 * ffem / fem,
                                                  color: Color(0xff000000),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        sezione!=null ? '${sezione?.descrizione}' : "",
                                                    style: GoogleFonts.ptSans(
                                                      fontSize: 16 * ffem,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20 * fem),
                            Container(
                              height: 350 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffd9d9d9),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: HelperService.getImage(sezione?.foto),
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
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20 * fem, 0 * fem, 20 * fem, 0 * fem),
              width: double.infinity,
              height: 50 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (numb > 1)
                    TextButton(
                      onPressed: () {
                        // Ricarica la pagina con il nuovo valore di num
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GeofScene(numb: numb - 1, tappa: tappa, tour: tour),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffC3CDD8),
                        primary: Color(0xff283236),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/scene/images/icone-Evg2.png',
                            width: 4.95 * fem,
                            height: 7.68 * fem,
                          ),
                          SizedBox(width: 8 * fem),
                          Text(
                            'Indietro',
                            style: GoogleFonts.ptSans(
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (numb == max) // Aggiunta della condizione qui
                    TextButton(
                      onPressed: () {
                        _showFinishDialog(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 24 * fem,
                          ),
                          SizedBox(width: 8 * fem),
                          Text(
                            'Termina',
                            style: GoogleFonts.ptSans(
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff283236),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (numb < max!)
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GeofScene(numb: numb + 1, tappa: tappa, tour: tour),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffffa723),
                        primary: Color(0xff283236),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/scene/images/icone-Evg.png',
                            width: 4.95 * fem,
                            height: 7.68 * fem,
                          ),
                          SizedBox(width: 8 * fem),
                          Text(
                            'Prosegui',
                            style: GoogleFonts.ptSans(
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff283236),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBarScene(),
    );
  }
}
