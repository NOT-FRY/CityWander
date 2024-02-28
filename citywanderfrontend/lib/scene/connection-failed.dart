import 'package:flutter/material.dart';

class ConnectionFailedScene extends StatelessWidget {
  const ConnectionFailedScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fem = screenWidth / 390;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/scene/images/connection_failed.png',
            fit: BoxFit.cover,
            height: screenHeight,
            width: screenWidth,
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Errore di connessione',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25 * ffem,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Errore di connessione al server, per favore riprova tra qualche minuto.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16 * ffem,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/seleziona-lingua');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0072a3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10 * fem,
                        horizontal: 20 * fem,
                      ),
                      child: Text(
                        'Riprova',
                        style: TextStyle(
                          fontSize: 16 * ffem,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
