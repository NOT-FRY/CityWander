import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocaleEsercenteScene extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final String address;

  LocaleEsercenteScene({
    required this.image,
    required this.title,
    required this.description,
    required this.address
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / baseWidth;
    double ffem = fem * 0.97;
    double imageWidth = screenWidth / 3 - 30 * fem;
    double imageHeight = 100 * fem;
    Random random = new Random();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
              Navigator.pop(context);
            },
          ),
        ),
        titleSpacing: 0.0, // Imposta lo spazio tra il titolo e l'icona a 0
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20 * fem, 20 * fem, 20 * fem, 20 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.ptSans(
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff00372c),
                ),
              ),
              SizedBox(height: 20 * fem),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Valutazione: ',
                      style: GoogleFonts.ptSans(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                    ...List.generate(random.nextInt(4)+1, (_) => Icon(Icons.star, color: Colors.amber, size: 18 * fem)),
                    Icon(Icons.star_half, color: Colors.amber, size: 18 * fem),
                  ],
                ),
              ),
              SizedBox(height: 20 * fem),
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                  Container(
                    width: imageWidth,
                    height: imageHeight,
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: image,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/scene/images/rectangle-25-bg.png',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/scene/images/rectangle-22-bg.png',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/scene/images/rectangle-26-bg.png',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/scene/images/rectangle-24-bg.png',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/scene/images/rectangle-27-bg.png',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ]
                ),
              ),
              SizedBox(height: 20 * fem),
              Center(
                child: Text(
                  'Visualizza menu',
                  style: GoogleFonts.ptSans(
                    fontSize: 22 * ffem,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(height: 20 * fem),
              Text(
                address,
                style: GoogleFonts.ptSans(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 10 * fem),
              Text(
                'ORARIO',
                style: GoogleFonts.ptSans(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 10 * fem),
              Text(
                'LUN - SAB: 12:45 / 15:15 - 19:45 / 23:00\nDOM: 12:45 / 15:30 - 19:45 / 23:00',
                style: GoogleFonts.ptSans(
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
