import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // menuaDr (1205:647)
        padding: EdgeInsets.fromLTRB(0*fem, 46*fem, 0*fem, 2*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfff5f5f5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // nametkL (1205:648)
              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 41*fem, 10*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // icone37S (1205:649)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                    width: 25*fem,
                    height: 25*fem,
                    child: Image.asset(
                      'assets/scene/images/icone-P6U.png',
                      width: 25*fem,
                      height: 25*fem,
                    ),
                  ),
                  Text(
                    // portovecchioristorantepizzeria (1205:650)
                    'PORTOVECCHIO Ristorante-Pizzeria',
                    style: SafeGoogleFont (
                      'PT Sans',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2925*ffem/fem,
                      color: Color(0xff00372c),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // menu2VA (1205:651)
              width: double.infinity,
              height: 54*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Center(
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont (
                    'PT Sans',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2925*ffem/fem,
                    color: Color(0xff00372c),
                  ),
                ),
              ),
            ),
            Container(
              // autogroupm3hetnG (4H5B2GBLpaiwde7tiHm3He)
              width: double.infinity,
              height: 706*fem,
              child: Stack(
                children: [
                  Positioned(
                    // menu3fA (1205:653)
                    left: 0*fem,
                    top: 0*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16*fem, 4*fem, 16*fem, 0*fem),
                      width: 390*fem,
                      height: 626*fem,
                      decoration: BoxDecoration (
                        color: Color(0xffffffff),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // frame2073uxG (1205:654)
                            width: double.infinity,
                            height: 181*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame2066Tit (1205:655)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 0*fem),
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame20607YY (1205:656)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg-W3E.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // insalatamista1P2 (1205:657)
                                        'Insalata Mista',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062vVz (1205:659)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // gEG (1205:660)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 115.5*fem, 0*fem),
                                              child: Text(
                                                '5€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // CCc (1205:661)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '3',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconefrt (1205:662)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-ouv.png',
                                                width: 12*fem,
                                                height: 12*fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame20651fr (1205:664)
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame2060si4 (1205:665)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg-ahr.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // orataalimoneyWC (1205:666)
                                        'Orata a Limone',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame20627cQ (1205:668)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // GkC (1205:669)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97.5*fem, 0*fem),
                                              child: Text(
                                                '15€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // 9Z6 (1205:670)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '4.7',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconeVN4 (1205:671)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-Pyn.png',
                                                width: 12*fem,
                                                height: 12*fem,
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
                          SizedBox(
                            height: 16*fem,
                          ),
                          Container(
                            // frame2069tuz (1205:672)
                            width: double.infinity,
                            height: 177*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame2063euA (1205:673)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 0*fem),
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame2060hMe (1205:674)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg-Qh2.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // salmoneecoccoaAY (1205:675)
                                        'Salmone e Cocco',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062s9e (1205:677)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // CSp (1205:678)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97.5*fem, 0*fem),
                                              child: Text(
                                                '20€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // jSk (1205:679)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '4.7',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconeUQL (1205:680)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-g1J.png',
                                                width: 12*fem,
                                                height: 12*fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame2064yrt (1205:682)
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame20604tL (1205:683)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg-aex.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // salmoneebroccolibdN (1205:684)
                                        'Salmone e Broccoli',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062J1z (1205:686)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // erY (1205:687)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97.5*fem, 0*fem),
                                              child: Text(
                                                '15€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // Yh2 (1205:688)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '4.7',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconeVMN (1205:689)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-qvU.png',
                                                width: 12*fem,
                                                height: 12*fem,
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
                          SizedBox(
                            height: 16*fem,
                          ),
                          Container(
                            // frame2070E44 (1205:690)
                            width: double.infinity,
                            height: 177*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame2065xVr (1205:691)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 0*fem),
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame2060ReL (1205:692)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg-koW.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // orataalimonetXv (1205:693)
                                        'Orata a Limone',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062DKJ (1205:695)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // Ha4 (1205:696)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97.5*fem, 0*fem),
                                              child: Text(
                                                '15€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // csE (1205:697)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '4.7',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconexgC (1205:698)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-Cc4.png',
                                                width: 12*fem,
                                                height: 12*fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame20666Gc (1205:700)
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame2060wHE (1205:701)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // insalatamistar9J (1205:702)
                                        'Insalata Mista',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062zWQ (1205:704)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // Wje (1205:705)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 115.5*fem, 0*fem),
                                              child: Text(
                                                '5€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // FhE (1205:706)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '3',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconezep (1205:707)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-noE.png',
                                                width: 12*fem,
                                                height: 12*fem,
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
                          SizedBox(
                            height: 16*fem,
                          ),
                          Container(
                            // frame2074J9i (1205:708)
                            width: double.infinity,
                            height: 177*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame2063dSt (1205:709)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 0*fem),
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame20604HJ (1205:710)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg-5k8.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // salmoneecoccokR2 (1205:711)
                                        'Salmone e Cocco',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062sVe (1205:713)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // pvg (1205:714)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97.5*fem, 0*fem),
                                              child: Text(
                                                '20€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // k3e (1205:715)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '4.7',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconegT6 (1205:716)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-Hme.png',
                                                width: 12*fem,
                                                height: 12*fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame2064vsE (1205:718)
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame2060QGc (1205:719)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg-emS.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // salmoneebroccoliLAG (1205:720)
                                        'Salmone e Broccoli',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062Gpc (1205:722)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // DUx (1205:723)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97.5*fem, 0*fem),
                                              child: Text(
                                                '15€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // xSY (1205:724)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '4.7',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconeUfn (1205:725)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-NNQ.png',
                                                width: 12*fem,
                                                height: 12*fem,
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
                          SizedBox(
                            height: 16*fem,
                          ),
                          Container(
                            // frame2075R5E (1205:726)
                            width: double.infinity,
                            height: 177*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame2065NmA (1205:727)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 0*fem),
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame2065ByW (1205:728)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2065-bg.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // pacchericonscampiiyS (1205:729)
                                        'Paccheri con Scampi',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062GEG (1205:731)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // c3E (1205:732)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97.5*fem, 0*fem),
                                              child: Text(
                                                '17€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // Xfz (1205:733)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '4.7',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconeFbz (1205:734)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-o1e.png',
                                                width: 12*fem,
                                                height: 12*fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame2066CGL (1205:736)
                                  padding: EdgeInsets.fromLTRB(4*fem, 4*fem, 4*fem, 4*fem),
                                  width: 160.5*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    gradient: LinearGradient (
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[Color(0xff00372c), Color(0x0000372c)],
                                      stops: <double>[0, 1],
                                    ),
                                    borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(16*fem),
                                      topRight: Radius.circular(16*fem),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame2060e8L (1205:737)
                                        width: double.infinity,
                                        height: 131*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xffffffff),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/scene/images/frame-2060-bg-QJ8.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only (
                                            topLeft: Radius.circular(16*fem),
                                            topRight: Radius.circular(16*fem),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Text(
                                        // insalatamistajvU (1205:738)
                                        'Insalata Mista',
                                        style: SafeGoogleFont (
                                          'PT Sans',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2*fem,
                                      ),
                                      Container(
                                        // frame2062SZz (1205:740)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // AVz (1205:741)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 115.5*fem, 0*fem),
                                              child: Text(
                                                '5€',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // JMJ (1205:742)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                              child: Text(
                                                '3',
                                                style: SafeGoogleFont (
                                                  'PT Sans',
                                                  fontSize: 13*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925*ffem/fem,
                                                  color: Color(0xff8e4007),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // iconeqc8 (1205:743)
                                              width: 12*fem,
                                              height: 12*fem,
                                              child: Image.asset(
                                                'assets/scene/images/icone-Kvt.png',
                                                width: 12*fem,
                                                height: 12*fem,
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
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // menuutentePNk (1205:744)
                    left: 0*fem,
                    top: 602*fem,
                    child: Container(
                      width: 390*fem,
                      height: 104*fem,
                      decoration: BoxDecoration (
                        color: Color(0xfff5f5f5),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // frame1972iA8 (I1205:744;49:1627)
                            left: 25*fem,
                            top: 24*fem,
                            child: Container(
                              width: 132*fem,
                              height: 77*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // navigationmenuhomedXz (I1205:744;49:1628)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                    padding: EdgeInsets.fromLTRB(15*fem, 12.5*fem, 15*fem, 12.5*fem),
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(0*fem, 4*fem),
                                          blurRadius: 2*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // vectorW5z (I1205:744;338:977)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                          width: 24*fem,
                                          height: 24*fem,
                                          child: Image.asset(
                                            'assets/scene/images/vector-w1W.png',
                                            width: 24*fem,
                                            height: 24*fem,
                                          ),
                                        ),
                                        Text(
                                          // tourcui (I1205:744;49:1630)
                                          'Tour',
                                          style: SafeGoogleFont (
                                            'PT Sans',
                                            fontSize: 12*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2925*ffem/fem,
                                            color: Color(0xff00372c),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // navigationmenuhomeAgL (I1205:744;338:1116)
                                    padding: EdgeInsets.fromLTRB(4.5*fem, 12.5*fem, 4.5*fem, 12.5*fem),
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(0*fem, 4*fem),
                                          blurRadius: 2*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // vectorfNC (I1205:744;338:1117)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                          width: 24*fem,
                                          height: 24*fem,
                                          child: Image.asset(
                                            'assets/scene/images/vector-PRN.png',
                                            width: 24*fem,
                                            height: 24*fem,
                                          ),
                                        ),
                                        Text(
                                          // recognitionZCg (I1205:744;338:1118)
                                          'Recognition',
                                          style: SafeGoogleFont (
                                            'PT Sans',
                                            fontSize: 12*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2925*ffem/fem,
                                            color: Color(0xff00372c),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // frame1974uGY (I1205:744;338:1803)
                            left: 237*fem,
                            top: 24*fem,
                            child: Container(
                              width: 128*fem,
                              height: 77*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // navigationmenuhomeqfz (I1205:744;338:1804)
                                    padding: EdgeInsets.fromLTRB(15*fem, 12.5*fem, 15*fem, 12.5*fem),
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(0*fem, 4*fem),
                                          blurRadius: 2*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // vectormJk (I1205:744;338:1805)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                          width: 24*fem,
                                          height: 24*fem,
                                          child: Image.asset(
                                            'assets/scene/images/vector-H1N.png',
                                            width: 24*fem,
                                            height: 24*fem,
                                          ),
                                        ),
                                        Text(
                                          // wallet77i (I1205:744;338:1806)
                                          'Wallet',
                                          style: SafeGoogleFont (
                                            'PT Sans',
                                            fontSize: 12*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2925*ffem/fem,
                                            color: Color(0xff00372c),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // navigationmenuhomef9E (I1205:744;338:1807)
                                    padding: EdgeInsets.fromLTRB(15*fem, 12.5*fem, 15*fem, 12.5*fem),
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(0*fem, 4*fem),
                                          blurRadius: 2*fem,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // vectorKja (I1205:744;338:1808)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                          width: 24*fem,
                                          height: 24*fem,
                                          child: Image.asset(
                                            'assets/scene/images/vector-Xt8.png',
                                            width: 24*fem,
                                            height: 24*fem,
                                          ),
                                        ),
                                        Text(
                                          // profileeWx (I1205:744;338:1809)
                                          'Profile',
                                          style: SafeGoogleFont (
                                            'PT Sans',
                                            fontSize: 12*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2925*ffem/fem,
                                            color: Color(0xff00372c),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // frame1975MgG (I1205:744;459:1482)
                            left: 151.5*fem,
                            top: 0*fem,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6*fem, 6*fem, 6*fem, 6*fem),
                              width: 94*fem,
                              height: 97*fem,
                              decoration: BoxDecoration (
                                border: Border.all(color: Color(0xfff5f5f5)),
                                borderRadius: BorderRadius.circular(60*fem),
                              ),
                              child: Container(
                                // frame1965r7E (I1205:744;459:1483)
                                padding: EdgeInsets.fromLTRB(10*fem, 10*fem, 7*fem, 10*fem),
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  border: Border.all(color: Color(0xff4da8d9)),
                                  color: Color(0xff0072a3),
                                  borderRadius: BorderRadius.circular(50*fem),
                                ),
                                child: Center(
                                  // pricipe105x1051BQQ (I1205:744;459:1484)
                                  child: SizedBox(
                                    width: 65*fem,
                                    height: 65*fem,
                                    child: Image.asset(
                                      'assets/scene/images/pricipe105x105-1-FKJ.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
          ],
        ),
      ),
          );
  }
}