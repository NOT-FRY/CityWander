import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/service/ApiUserService.dart';
import 'package:myapp/service/SecureStorageService.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';
import 'package:myapp/scene/navbar.dart';

class WalletScene extends StatefulWidget {
  @override
  _WalletScene createState() => _WalletScene();
}

class _WalletScene extends State<WalletScene> {

  int punti = 0;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  void loadUserInfo() {
    SecureStorageService.storage.read(key: "EMAIL").then((mail) {
      //Da memorizzare come stato!
      if (mail != null && mail.isNotEmpty) {
        ApiUserService().findUserByEmail(mail).then((userModel) {
          if (userModel != null) {
            punti= userModel.punti!;
            setState(() {});
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
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
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
        ),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 390 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                27 * fem, 10 * fem, 27 * fem, 0 * fem),
                            width: double.infinity,
                            height: 62 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xff00372c),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16 * fem),
                                bottomRight: Radius.circular(16 * fem),
                              ),
                            ),
                            child: Center(
                              child: SizedBox(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 195 * fem,
                                  ),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: SafeGoogleFont(
                                        'PT Sans',
                                        fontSize: 18 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2925 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Hai accumulato $punti punti Congratulazioni! ',
                                          style: SafeGoogleFont(
                                            'PT Sans',
                                            fontSize: 18 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2925 * ffem / fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                10 * fem, 20 * fem, 10 * fem, 10 * fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 20 * fem),
                                  child: Text(
                                    'Scegli un premio, vedi tutte le informazioni e riscattalo!',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'PT Sans',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2925 * ffem / fem,
                                      color: Color(0xff00372c),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nettuno',
                                              style: SafeGoogleFont(
                                                'PT Sans',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2925 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '50% ',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 30 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xffffa723),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 130 * fem,
                                                  ),
                                                  child: Text(
                                                    'di sconto acquistando una bibita e un gelato',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xff363636),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                'Questo è il QR code per riscattare il tuo premio, mostralo in cassa',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 20),
                                                              Image.asset(
                                                                'assets/scene/images/QRcode.png',
                                                                width: 200,
                                                              ),
                                                            ],
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                  'Chiudi'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      10 * fem,
                                                      4 * fem,
                                                      10 * fem,
                                                      4 * fem,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffffa723),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15 * fem),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x3f000000),
                                                          offset: Offset(
                                                              0 * fem, 4 * fem),
                                                          blurRadius: 2 * fem,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 16 * fem,
                                                          height: 16 * fem,
                                                          child: Image.asset(
                                                            'assets/scene/images/vector-fUp.png',
                                                            width: 16 * fem,
                                                            height: 16 * fem,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: 5 * fem),
                                                        Text(
                                                          'Riscatta premio',
                                                          style: SafeGoogleFont(
                                                            'PT Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2925 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-57-bg-m64.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-58-bg-DJU.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-59-bg-kvp.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-60-bg-MkY.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-61-bg-WvG.png',
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
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Porcavacca',
                                              style: SafeGoogleFont(
                                                'PT Sans',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2925 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Dolce ',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 30 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xffffa723),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 130 * fem,
                                                  ),
                                                  child: Text(
                                                    'in omaggio ordinando una tagliata di angus',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xff363636),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                'Questo è il QR code per riscattare il tuo premio, mostralo in cassa',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 20),
                                                              Image.asset(
                                                                'assets/scene/images/QRcode.png',
                                                                width: 200,
                                                              ),
                                                            ],
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                  'Chiudi'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      10 * fem,
                                                      4 * fem,
                                                      10 * fem,
                                                      4 * fem,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffffa723),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15 * fem),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x3f000000),
                                                          offset: Offset(
                                                              0 * fem, 4 * fem),
                                                          blurRadius: 2 * fem,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 16 * fem,
                                                          height: 16 * fem,
                                                          child: Image.asset(
                                                            'assets/scene/images/vector-fUp.png',
                                                            width: 16 * fem,
                                                            height: 16 * fem,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: 5 * fem),
                                                        Text(
                                                          'Riscatta premio',
                                                          style: SafeGoogleFont(
                                                            'PT Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2925 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-57-bg-2Sx.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-58-bg.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-59-bg.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-60-bg-iQ4.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-61-bg-SAY.png',
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
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Teatro Verdi',
                                              style: SafeGoogleFont(
                                                'PT Sans',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2925 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Biglietto ',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 30 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xffffa723),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 130 * fem,
                                                  ),
                                                  child: Text(
                                                    'in omaggio per \nun adulto',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xff363636),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                'Questo è il QR code per riscattare il tuo premio, mostralo in cassa',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 20),
                                                              Image.asset(
                                                                'assets/scene/images/QRcode.png',
                                                                width: 200,
                                                              ),
                                                            ],
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                  'Chiudi'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      10 * fem,
                                                      4 * fem,
                                                      10 * fem,
                                                      4 * fem,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffffa723),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15 * fem),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x3f000000),
                                                          offset: Offset(
                                                              0 * fem, 4 * fem),
                                                          blurRadius: 2 * fem,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 16 * fem,
                                                          height: 16 * fem,
                                                          child: Image.asset(
                                                            'assets/scene/images/vector-fUp.png',
                                                            width: 16 * fem,
                                                            height: 16 * fem,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: 5 * fem),
                                                        Text(
                                                          'Riscatta premio',
                                                          style: SafeGoogleFont(
                                                            'PT Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2925 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-57-bg-isE.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-58-bg-3cQ.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-59-bg-FgQ.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-60-bg-EUU.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-61-bg-GFN.png',
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
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Castello Arechi',
                                              style: SafeGoogleFont(
                                                'PT Sans',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2925 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Biglietto ',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 30 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xffffa723),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 130 * fem,
                                                  ),
                                                  child: Text(
                                                    'in omaggio ogni\n2 acquisti',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xff363636),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                'Questo è il QR code per riscattare il tuo premio, mostralo in cassa',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 20),
                                                                Image.asset(
                                                                  'assets/scene/images/QRcode2.png',
                                                                  width: 200,
                                                                ),
                                                            ],
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                  'Chiudi'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      10 * fem,
                                                      4 * fem,
                                                      10 * fem,
                                                      4 * fem,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffffa723),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15 * fem),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x3f000000),
                                                          offset: Offset(
                                                              0 * fem, 4 * fem),
                                                          blurRadius: 2 * fem,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 16 * fem,
                                                          height: 16 * fem,
                                                          child: Image.asset(
                                                            'assets/scene/images/vector-fUp.png',
                                                            width: 16 * fem,
                                                            height: 16 * fem,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: 5 * fem),
                                                        Text(
                                                          'Riscatta premio',
                                                          style: SafeGoogleFont(
                                                            'PT Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2925 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-57-bg-ezg.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-58-bg-SZa.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-59-bg-fEk.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-60-bg.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-61-bg-vg4.png',
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
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Langella Rent Boat',
                                              style: SafeGoogleFont(
                                                'PT Sans',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2925 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '5% ',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 30 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xffffa723),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 130 * fem,
                                                  ),
                                                  child: Text(
                                                    'di sconto su noleggi di medio-piccole dimensioni',
                                                    style: SafeGoogleFont(
                                                      'PT Sans',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.2925 * ffem / fem,
                                                      color: Color(0xff363636),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                'Questo è il QR code per riscattare il tuo premio, mostralo in cassa',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 20),
                                                              Image.asset(
                                                                'assets/scene/images/QRcode.png',
                                                                width: 200,
                                                              ),
                                                            ],
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                  'Chiudi'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      10 * fem,
                                                      4 * fem,
                                                      10 * fem,
                                                      4 * fem,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffffa723),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15 * fem),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x3f000000),
                                                          offset: Offset(
                                                              0 * fem, 4 * fem),
                                                          blurRadius: 2 * fem,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 16 * fem,
                                                          height: 16 * fem,
                                                          child: Image.asset(
                                                            'assets/scene/images/vector-fUp.png',
                                                            width: 16 * fem,
                                                            height: 16 * fem,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: 5 * fem),
                                                        Text(
                                                          'Riscatta premio',
                                                          style: SafeGoogleFont(
                                                            'PT Sans',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2925 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-57-bg-x8k.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-58-bg-mpG.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-59-bg-pyS.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-60-bg-CUc.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8 * fem,
                                                    ),
                                                    Container(
                                                      width: 110 * fem,
                                                      height: 110 * fem,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffd9d9d9),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/scene/images/rectangle-61-bg.png',
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
                                    ),
                                  ],
                                ),
                              ],
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
      bottomNavigationBar: NavBarScene(),
    );
  }
}
