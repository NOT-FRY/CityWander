import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/scene/navbar.dart';

class LungomareScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ffem = MediaQuery.of(context).textScaleFactor;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lungomare Trieste',
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
                  image: AssetImage(
                    'assets/scene/images/rectangle-10-bg-3nC.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Il Lungomare Trieste è una delle gemme nascoste di Salerno, offrendo una splendida vista panoramica sul Mar Tirreno. Questa lunga passeggiata costiera si estende per diversi chilometri lungo la costa, ed è il luogo ideale per una rilassante passeggiata serale o una giornata di relax al mare. Le sue caratteristiche principali includono:\n\nPanoramiche mozzafiato: Mentre ti immergi nell\'atmosfera mediterranea, potrai godere di panorami spettacolari sul mare, con il Monte Vesuvio all\'orizzonte a nord e le montagne costiere a sud.\n\nSpiagge e lidi: Lungo il percorso, troverai una serie di spiagge e lidi dove puoi distenderti al sole o fare un tuffo nelle acque cristalline del Mar Tirreno.\n\nParchi e aree verdi: Il Lungomare è punteggiato da aree verdi e parchi, perfetti per un picnic o un momento di relax all\'ombra.\n\nRistoranti e caffetterie: Lungo la passeggiata, ci sono numerose opzioni per gustare piatti di pesce fresco o semplicemente sorseggiare un caffè guardando il mare.\n\nEventi culturali: Il Lungomare Trieste ospita spesso eventi culturali, mostre e spettacoli che aggiungono un tocco di vivacità a questa zona.',
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
