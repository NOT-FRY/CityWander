import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/LoginModel.dart';
import 'package:myapp/service/ApiAuthService.dart';
import 'dart:developer' as developer;

class RegisterScene extends StatefulWidget {
  final String languageSelected;
  RegisterScene(this.languageSelected);

  @override
  _RegisterSceneState createState() {
    return _RegisterSceneState(this.languageSelected);
  }
}

class _RegisterSceneState extends State<RegisterScene> {
  String languageSelected;
  _RegisterSceneState(this.languageSelected);

  DateTime selectedDate = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String selectedGender = 'Seleziona genere';

  String? passwordErrorMessage;
  String? emailError;
  String? usernameError;
  String? mobileNumberError;

  bool nameError = false;
  bool surnameError = false;
  bool passwordError = false;
  bool confirmPasswordError = false;
  bool genderError = false;
  bool passwordMatchError = false;
  bool isPasswordVisible = false;
  bool isTermsChecked = false;
  bool isButtonPressed = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  //controllo email e username
  Future<bool> isEmailAlreadyExists(String email) async {
    bool emailExists = await ApiAuthService().checkEmailExists(email);
    return emailExists;
  }

  Future<bool> isUsernameAlreadyExists(String username) async {
    bool usernameExists = await ApiAuthService().checkUsernameExists(username);
    return usernameExists;
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    mobileNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  bool isPhoneNumberValid(String phoneNumber) {
    final phoneRegExp = RegExp(r'^[0-9]+$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  bool _isPasswordSecure(String password) {
    // Verifica la lunghezza della password
    if (password.length < 8) {
      return false;
    }

    // Verifica se contiene almeno una lettera maiuscola
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    // Verifica se contiene almeno un numero
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    // Verifica se contiene almeno un carattere speciale
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    return true;
  }

  bool _validatePassword() {
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        passwordMatchError = true;
        passwordErrorMessage = "Le password non corrispondono";
        passwordError = false;
      });
      return false;
    } else if (!_isPasswordSecure(passwordController.text)) {
      setState(() {
        passwordError = true;
        passwordErrorMessage =
            "Password non sicura, utilizzare almeno 8 caratteri con una maiuscola, un numero e un carattere speciale";
        passwordMatchError = false;
      });
      return false;
    } else {
      setState(() {
        passwordMatchError = false;
        passwordError = false;
        passwordErrorMessage = null;
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff0072a3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      child: Center(
                        child: Image.asset(
                          'assets/scene/images/Logo_esteso_CityWander.png',
                          width: 400,
                          height: 100,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                      child: Text(
                        'Registrati per accedere all\'app!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ptSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    buildTextField(
                      "Nome",
                      nameController,
                      hintText: "Inserisci il tuo nome",
                      error: nameError,
                      errorMessage: "Campo obbligatorio",
                    ),
                    buildTextField(
                      "Cognome",
                      surnameController,
                      hintText: "Inserisci il tuo cognome",
                      error: surnameError,
                      errorMessage: "Campo obbligatorio",
                    ),
                    buildTextField(
                      "Email",
                      emailController,
                      hintText: "Inserisci la tua email",
                      error: emailError != null,
                      errorMessage: emailError,
                    ),
                    buildTextField(
                      "Username",
                      usernameController,
                      hintText: "Scegli un username",
                      error: usernameError != null,
                      errorMessage: usernameError,
                    ),
                    buildDateOfBirthField(context),
                    buildGenderDropdownField(context),
                    buildTextField(
                      "Numero di Cellulare",
                      mobileNumberController,
                      hintText: "Inserisci il tuo numero di cellulare",
                      error: mobileNumberError != null,
                      errorMessage: mobileNumberError,
                    ),
                    buildPasswordField(
                      "Password",
                      passwordController,
                      hintText: "Inserisci la tua password",
                      error: passwordError,
                    ),
                    buildPasswordField(
                      "Conferma password",
                      confirmPasswordController,
                      hintText: "Conferma la tua password",
                      error: confirmPasswordError,
                    ),
                    Container(
                      width: double.infinity,
                      height: 48,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: isTermsChecked,
                                    onChanged: (newValue) {
                                      setState(() {
                                        isTermsChecked = newValue!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        'Termini e servizi',
                                        style: GoogleFonts.ptSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              isButtonPressed && !isTermsChecked
                                                  ? Color(0xffff0000)
                                                  : Color(0xffffffff),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isButtonPressed = true;
                                // Controlli dei campi vuoti
                                nameError = nameController.text.isEmpty;
                                surnameError = surnameController.text.isEmpty;
                                emailError = emailController.text.isEmpty ||
                                        !isEmailValid(emailController.text)
                                    ? "Email non valida"
                                    : null;

                                usernameError = usernameController.text.isEmpty
                                    ? "Campo obbligatorio"
                                    : null;

                                mobileNumberError =
                                    mobileNumberController.text.isEmpty ||
                                            !isPhoneNumberValid(
                                                mobileNumberController.text)
                                        ? "Numero di telefono non valido"
                                        : null;
                                passwordError = passwordController.text.isEmpty;
                                confirmPasswordError =
                                    confirmPasswordController.text.isEmpty;

                                // Verifica se l'email esiste già
                                if (emailController.text.isNotEmpty) {
                                  isEmailAlreadyExists(emailController.text)
                                      .then((emailExists) {
                                    if (emailExists) {
                                      setState(() {
                                        emailError =
                                            "Questa email è già registrata";
                                      });
                                      return;
                                    } else {
                                      setState(() {
                                        emailError = null;
                                      });
                                    }
                                  });
                                }

                                // Verifica se l'username esiste già
                                if (usernameController.text.isNotEmpty) {
                                  isUsernameAlreadyExists(
                                          usernameController.text)
                                      .then((usernameExists) {
                                    if (usernameExists) {
                                      setState(() {
                                        usernameError =
                                            "Questo username è già in uso";
                                      });
                                      return;
                                    } else {
                                      setState(() {
                                        usernameError = null;
                                      });
                                    }
                                  });
                                }

                                // Esegui la validazione delle password
                                bool passwordValid = _validatePassword();

                                // Controlla se il checkbox è spuntato
                                if (!isTermsChecked) {
                                  developer.log(
                                      "Accetta i Termini e servizi per registrarti.");
                                  return;
                                }

                                // Se uno qualsiasi dei campi è vuoto o l'email/numero di telefono non è valida, non procedere con la registrazione
                                if (nameError ||
                                    surnameError ||
                                    emailError != null ||
                                    usernameError != null ||
                                    mobileNumberError != null ||
                                    passwordError ||
                                    confirmPasswordError ||
                                    passwordMatchError ||
                                    !isTermsChecked) {
                                  developer.log(
                                      "Controlli non superati. Utente non registrato.");
                                  return;
                                }

                                if (!nameError &&
                                    !surnameError &&
                                    emailError == null &&
                                    usernameError == null &&
                                    mobileNumberError == null &&
                                    !passwordError &&
                                    !confirmPasswordError &&
                                    !passwordMatchError &&
                                    isTermsChecked) {
                                  // Esegui la registrazione qui
                                  Future<LoginModel?> _registerModel =
                                      ApiAuthService().register(
                                          nameController.text,
                                          surnameController.text,
                                          usernameController.text,
                                          emailController.text,
                                          confirmPasswordController.text,
                                          languageSelected == "Italiano"
                                              ? "IT"
                                              : "EN", // :-/
                                          selectedGender,
                                          mobileNumberController.text,
                                          selectedDate);
                                  _registerModel.then((registerModel) {
                                    if (registerModel != null) {
                                      // Effettua il push alla pagina home dopo la registrazione
                                      Navigator.pushNamed(context, '/home');
                                    } else {
                                      developer.log(
                                          "Server Error: User not correctly registered");
                                    }
                                  });
                                }
                              });
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 150,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffffa723),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Registrati',
                                  style: GoogleFonts.ptSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {String? hintText, bool error = false, String? errorMessage}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
            child: Text(
              label,
              style: GoogleFonts.ptSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xb2ffffff),
              borderRadius: BorderRadius.circular(4),
              border:
                  Border.all(color: error ? Colors.red : Colors.transparent),
            ),
            child: TextField(
              controller: controller,
              style: GoogleFonts.ptSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          if (error && errorMessage != null)
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                errorMessage,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildDateOfBirthField(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
            child: Text(
              "Data di Nascita",
              style: GoogleFonts.ptSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xb2ffffff),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: GoogleFonts.ptSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    'Seleziona Data',
                    style: GoogleFonts.ptSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff0072a3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGenderDropdownField(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
            child: Text(
              'Seleziona genere',
              style: GoogleFonts.ptSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xb2ffffff),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: genderError ? Colors.red : Colors.transparent),
            ),
            child: DropdownButton<String>(
              value: selectedGender,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              style: GoogleFonts.ptSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: selectedGender == 'Seleziona genere'
                    ? Color(0xffa0a0a0)
                    : Color(0xff000000),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue ?? 'Uomo';
                  genderError = false;
                });
              },
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  value: 'Seleziona genere',
                  child: Text(
                    'Seleziona genere',
                    style: GoogleFonts.ptSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffa0a0a0),
                    ),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'Uomo',
                  child: Text('Uomo'),
                ),
                DropdownMenuItem<String>(
                  value: 'Donna',
                  child: Text('Donna'),
                ),
                DropdownMenuItem<String>(
                  value: 'Altro',
                  child: Text('Altro'),
                ),
              ],
              underline: Container(
                height: 0,
              ),
            ),
          ),
          if (genderError)
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                'Campo obbligatorio',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller,
      {String? hintText, bool error = false}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
            child: Text(
              label,
              style: GoogleFonts.ptSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xb2ffffff),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: error || passwordMatchError
                      ? Colors.red
                      : Colors.transparent),
            ),
            child: TextFormField(
              controller: controller,
              obscureText: !isPasswordVisible,
              style: GoogleFonts.titilliumWeb(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          if (error)
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                'Password non valida, utilizzare almeno 8 caratteri con una maiuscola, un numero e un carattere speciale',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
