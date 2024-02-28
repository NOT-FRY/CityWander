import 'package:flutter/material.dart';
import 'package:myapp/scene/registrazione-utente.dart';
import 'package:myapp/service/ApiAuthService.dart';
import 'package:myapp/service/SecureStorageService.dart';
import 'package:myapp/utils.dart';

class SelectLanguageScene extends StatefulWidget {
  @override
  _SelectLanguageSceneState createState() => _SelectLanguageSceneState();
}

class _SelectLanguageSceneState extends State<SelectLanguageScene> {
  List<String> languageOptions = ['Italiano', 'Inglese'];
  String selectedLanguage = 'Italiano';
  static bool alreadyVerifyingServerStatus = false; //Loop su errore connessione

  @override
  void initState() {
    super.initState();
    if (!alreadyVerifyingServerStatus) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        alreadyVerifyingServerStatus = true;
        verifyServerStatus();
        autoLogin();
      });
    }
  }

  Future<void> verifyServerStatus() async {
    ApiAuthService().isServerAvailable().then((isServerAvailable) {
      alreadyVerifyingServerStatus = false;
      if (!isServerAvailable) {
        Navigator.pushNamed(context, '/connection-failed');
      }
    });
  }

  void autoLogin() {
    SecureStorageService.storage.read(key: "EMAIL").then((email) {
      if (email != null && email.isNotEmpty) {
        SecureStorageService.storage.read(key: "ROLE").then((ruolo) {
          if (ruolo != null && ruolo.isNotEmpty) {
            if (ruolo == "TURISTA") {
              Navigator.pushNamed(context, '/home');
            } else if (ruolo == "ESERCENTE") {
              Navigator.pushNamed(context, '/esercente');
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 390;
    double ffem = fem * 0.97;
    return WillPopScope(
        //disabilito back button
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 12 * fem),
            color: Color(0xff0072a3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50 * fem),
                Container(
                  child: Center(
                    child: Image.asset(
                      'assets/scene/images/Logo_esteso_CityWander.png',
                      width: 400,
                      height: 200,
                    ),
                  ),
                ),
                SizedBox(height: 15 * fem),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seleziona la lingua',
                      style: SafeGoogleFont(
                        'PT Sans',
                        fontSize: 26 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 0.9230769231 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(height: 10 * fem),
                    Container(
                      height: 40 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xb2ffffff),
                        borderRadius: BorderRadius.circular(4 * fem),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                        child: DropdownButton<String>(
                          value: selectedLanguage,
                          iconSize: 24 * fem,
                          elevation: 16,
                          isExpanded: true,
                          style: SafeGoogleFont(
                            'PT Sans',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                          dropdownColor: Color(0xFFF5F5F5),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedLanguage = newValue;
                              });
                            }
                          },
                          items: languageOptions.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 25 * fem,
                                      height: 25 * fem,
                                      margin: EdgeInsets.only(right: 10 * fem),
                                      child: Image.asset(
                                        value == 'Italiano'
                                            ? 'assets/scene/images/it.png'
                                            : 'assets/scene/images/en.png',
                                        width: 25 * fem,
                                        height: 25 * fem,
                                      ),
                                    ),
                                    Text(value),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                          underline: Container(height: 0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50 * fem),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Container(
                    height: 48 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffa723),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Accedi',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 22 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2925 * ffem / fem,
                          color: Color(0xff363636),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10 * fem),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) =>
                            RegisterScene(selectedLanguage))));
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Container(
                    height: 48 * fem,
                    decoration: BoxDecoration(
                      color: Color(0x7fc3cdd7),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Registrati',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 22 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2925 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10 * fem),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registrazioneeser');
                  },
                  child: Container(
                    height: 43 * fem,
                    child: Center(
                      child: Text(
                        'Sei un esercente?',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2925 * ffem / fem,
                          decoration: TextDecoration.underline,
                          color: Color(0xffffffff),
                          decorationColor: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
