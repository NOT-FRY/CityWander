import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/service/ApiAuthService.dart';
import 'package:myapp/service/ApiUserService.dart';
import 'package:myapp/service/SecureStorageService.dart';
import 'package:myapp/utils.dart';

class ProfileEsercenteScene extends StatefulWidget {
  @override
  _ProfileEsercenteSceneState createState() => _ProfileEsercenteSceneState();
}

class _ProfileEsercenteSceneState extends State<ProfileEsercenteScene> {
  String nome = "";
  String email = "";
  String username = "";
  String telefono = "";
  String lingua = "";
  String partitaIva = "";

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
            nome = userModel.nome!;
            email = userModel.email!;
            username = userModel.username!;
            telefono = userModel.telefono!;
            lingua = userModel.lingua!;
            partitaIva = userModel.partitaIva!;
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
          'Profilo',
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
              Navigator.pushNamed(context, '/esercente');
            },
          ),
        ),
        actions: [
          Transform.scale(
            scale: 0.8,
            child: IconButton(
              icon: Image.asset(
                'assets/scene/images/icone-6jW.png',
              ),
              onPressed: () {
                ApiAuthService.logout().then((value) =>
                    Navigator.pushNamed(context, '/seleziona-lingua'));
              },
            ),
          ),
        ],
        titleSpacing: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16 * fem),
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15 * fem),
                width: double.infinity,
                height: 30 * fem,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff000000),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          'Credenziali',
                          style: SafeGoogleFont(
                            'PT Sans',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2925 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    /*Container(
                      width: 25 * fem,
                      height: 25 * fem,
                      child: Image.asset(
                        'assets/scene/images/icone-pJQ.png',
                        width: 25 * fem,
                        height: 25 * fem,
                        alignment: Alignment.topCenter,
                      ),
                    ),*/
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10 * fem),
                      child: Text(
                        'Nome',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1302272081 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            nome,
                            style: SafeGoogleFont(
                              'PT Sans',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1302271949 * ffem / fem,
                              color: Color(0xff0d1015),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10 * fem),
                      child: Text(
                        'Email',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1302272081 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            email,
                            style: SafeGoogleFont(
                              'PT Sans',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1302271949 * ffem / fem,
                              color: Color(0xff0d1015),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10 * fem),
                      child: Text(
                        'Username',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1302272081 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            username,
                            style: SafeGoogleFont(
                              'PT Sans',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1302271949 * ffem / fem,
                              color: Color(0xff0d1015),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10 * fem),
                      child: Text(
                        'Cellulare',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1302272081 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            telefono,
                            style: SafeGoogleFont(
                              'PT Sans',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1302271949 * ffem / fem,
                              color: Color(0xff0d1015),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10 * fem),
                      child: Text(
                        'Partita IVA',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1302272081 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            partitaIva,
                            style: SafeGoogleFont(
                              'PT Sans',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1302271949 * ffem / fem,
                              color: Color(0xff0d1015),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10 * fem),
                      child: Text(
                        'Password',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1302272081 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '**********',
                            style: SafeGoogleFont(
                              'PT Sans',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1302271949 * ffem / fem,
                              color: Color(0xff0d1015),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 24 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 11 * fem),
                      child: Text(
                        'Lingua',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1302272081 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4 * fem),
                            width: 27.9 * fem,
                            height: 18 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4 * fem),
                              color: Color(0xffd9d9d9),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/scene/images/rectangle-1-bg.png',
                                ),
                              ),
                            ),
                          ),
                          Text(
                            lingua == "IT" ? "Italiano" : "Inglese",
                            style: SafeGoogleFont(
                              'PT Sans',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1302271949 * ffem / fem,
                              color: Color(0xff0d1015),
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
    );
  }
}
