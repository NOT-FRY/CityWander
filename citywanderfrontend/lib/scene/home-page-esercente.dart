import 'package:flutter/material.dart';

class EsercenteHomeScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60 * fem),
            Text(
              'Area esercente',
              style: TextStyle(
                fontSize: 24 * ffem,
                fontWeight: FontWeight.w700,
                color: Color(0xff00372c),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Seleziona l’attività da svolgere',
                    style: TextStyle(
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff00372c),
                    ),
                  ),
                  SizedBox(height: 50 * fem),
                  ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/profiloesercente');},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16 * fem),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Color(0xffffa723),
                        borderRadius: BorderRadius.circular(16 * fem),
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300 * fem),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              24.5 * fem, 8 * fem, 34.5 * fem, 7 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20 * fem),
                                width: 16 * fem,
                                height: 20 * fem,
                                child: Image.asset(
                                  'assets/scene/images/oi-user.png',
                                  width: 16 * fem,
                                  height: 20 * fem,
                                ),
                              ),
                              Text(
                                'Area utente',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * fem),
                  ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/localiesercente');},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16 * fem),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Color(0xffffa723),
                        borderRadius: BorderRadius.circular(16 * fem),
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300 * fem),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              16 * fem, 8 * fem, 6 * fem, 7 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10 * fem),
                                width: 20 * fem,
                                height: 20 * fem,
                                child: Image.asset(
                                  'assets/scene/images/oi-home.png',
                                  width: 20 * fem,
                                  height: 20 * fem,
                                ),
                              ),
                              Text(
                                'Visualizza locali',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * fem),
                  ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/registrazionelocale');},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16 * fem),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Color(0xffffa723),
                        borderRadius: BorderRadius.circular(16 * fem),
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 300 * fem),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              16.5 * fem, 8 * fem, 13.5 * fem, 7 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 15 * fem),
                                width: 20 * fem,
                                height: 20 * fem,
                                child: Image.asset(
                                  'assets/scene/images/oi-circle-add.png',
                                  width: 20 * fem,
                                  height: 20 * fem,
                                ),
                              ),
                              Text(
                                'Registra locale',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
