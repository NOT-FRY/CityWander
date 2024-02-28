import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/scene/navbar.dart';

class AttrazioneScene extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;

  AttrazioneScene({
    required this.image,
    required this.title,
    required this.description,
  });


  @override
  Widget build(BuildContext context) {
    double ffem = MediaQuery.of(context).textScaleFactor;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.ptSans(
            fontSize: 20 * ffem,
            fontWeight: FontWeight.w700,
            color: Color(0xff00372c),
          ),
        ),
        backgroundColor: Color(0xffd9d9d9),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:image,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                description,
                style: GoogleFonts.ptSans(
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1f1f1f),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBarScene(),
    );
  }
}
