import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/LoginModel.dart';
import 'package:myapp/service/ApiAuthService.dart';
import 'package:myapp/service/SecureStorageService.dart';

class LoginScene extends StatefulWidget {
  @override
  _LoginSceneState createState() => _LoginSceneState();
}

class _LoginSceneState extends State<LoginScene> {
  String emailOrUsername = '';
  String password = '';
  bool showError = false;
  bool isPasswordVisible = false;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final fem = screenWidth / 390;
    final ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff0072a3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/scene/images/Logo_esteso_CityWander.png',
                      width: 200 * ffem,
                      height: 100 * ffem,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      20 * fem,
                      31.5 * fem,
                      20 * fem,
                      47.5 * fem,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36 * fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                            0 * fem,
                            0 * fem,
                            0 * fem,
                            40 * fem,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 400 * fem,
                          ),
                          child: Text(
                            'Inserisci le tue credenziali per accedere all\'app!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ptSans(
                              fontSize: 22 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2925 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                  0 * fem,
                                  0 * fem,
                                  0 * fem,
                                  10 * fem,
                                ),
                                child: Text(
                                  'Email',
                                  style: GoogleFonts.ptSans(
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2925 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40.0,
                                margin: EdgeInsets.fromLTRB(
                                  0 * fem,
                                  0 * fem,
                                  0 * fem,
                                  8 * fem,
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  4 * fem,
                                  0 * fem,
                                  0 * fem,
                                  0 * fem,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xb2ffffff),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    emailOrUsername = value;
                                  },
                                  style: GoogleFonts.ptSans(
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2925 * ffem / fem,
                                    color: Color(0xff363636),
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Inserisci email',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                  0 * fem,
                                  0 * fem,
                                  0 * fem,
                                  10 * fem,
                                ),
                                child: Text(
                                  'Password',
                                  style: GoogleFonts.ptSans(
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2925 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40.0,
                                margin: EdgeInsets.fromLTRB(
                                  0 * fem,
                                  0 * fem,
                                  0 * fem,
                                  30 * fem,
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  4 * fem,
                                  0 * fem,
                                  0 * fem,
                                  0 * fem,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xb2ffffff),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: TextFormField(
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  controller: passwordController,
                                  obscureText: !isPasswordVisible,
                                  style: GoogleFonts.ptSans(
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2925 * ffem / fem,
                                    color: Color(0xff363636),
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Inserisci la password',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Color(0xff363636),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                      padding: EdgeInsets.fromLTRB(
                                          0 * fem, 10 * fem, 0 * fem, 9 * fem),
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8 * fem),
                                      ),
                                      child: Text(
                                        'Password dimenticata',
                                        style: GoogleFonts.ptSans(
                                          fontSize: 18 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2925 * ffem / fem,
                                          decoration: TextDecoration.underline,
                                          color: Color(0xffffffff),
                                          decorationColor: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 100 * fem),
                                      child: TextButton(
                                        onPressed: () {
                                          Future<LoginModel?> _loginModel =
                                              ApiAuthService().login(
                                                  emailOrUsername, password);
                                          _loginModel.then((loginModel) {
                                            if (loginModel != null) {
                                              SecureStorageService.storage
                                                  .read(key: "ROLE")
                                                  .then((ruolo) {
                                                if (ruolo != null &&
                                                    ruolo.isNotEmpty) {
                                                  if (ruolo == "TURISTA") {
                                                    Navigator.pushNamed(
                                                        context, '/home');
                                                  } else if (ruolo ==
                                                      "ESERCENTE") {
                                                    Navigator.pushNamed(
                                                        context, '/esercente');
                                                  }
                                                }
                                              });
                                            } else {
                                              developer.log(
                                                  "Utente non autenticato");
                                              setState(() {
                                                showError = true;
                                              });
                                            }
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: 115 * fem,
                                          height: 35 * fem,
                                          decoration: BoxDecoration(
                                            color: Color(0xffffa723),
                                            borderRadius:
                                                BorderRadius.circular(15 * fem),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Accedi',
                                              style: GoogleFonts.ptSans(
                                                fontSize: 18 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2925 * ffem / fem,
                                                color: Color(0xff363636),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              if (showError)
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Email o password errate",
                                    style: TextStyle(
                                      fontSize: 18 * ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2925 * ffem / fem,
                                      color: Colors.red,
                                    ),
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
    );
  }
}
