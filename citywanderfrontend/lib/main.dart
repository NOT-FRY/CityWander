import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/scene/connection-failed.dart';
import 'package:myapp/scene/lista-locali-no-crowfunding-1.dart';
import 'package:myapp/scene/geof1.dart';
import 'package:myapp/scene/smarttour-in-programma.dart';
import 'package:myapp/scene/menu.dart';
import 'package:myapp/scene/info-locale.dart';
import 'package:myapp/scene/info-locale-esercente.dart';
import 'package:myapp/scene/tour-in-programma.dart';
import 'package:myapp/scene/mappa-tour.dart';
import 'package:myapp/scene/assistente.dart';
import 'package:myapp/scene/image-ricognition.dart';
import 'package:myapp/scene/wallet.dart';
import 'package:myapp/scene/profilo.dart';
import 'package:myapp/scene/profilo-esercente.dart';
import 'package:myapp/scene/lungomare-trieste.dart';
import 'package:myapp/scene/home-page.dart';
import 'package:myapp/scene/registrazione-utente.dart';
import 'package:myapp/scene/registrazione-esercente.dart';
import 'package:myapp/scene/login.dart';
import 'package:myapp/scene/seleziona-lingua.dart';
import 'package:myapp/scene/profilazione.dart';
import 'package:myapp/scene/home-page-esercente.dart';
import 'package:myapp/scene/Locali-esercente.dart';
import 'package:myapp/scene/Registrazione-locale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// richiesti solo in image recognition
// Future<void> requestCameraPermission() async {
//   final status = await Permission.camera.request();
//   if (status.isGranted) {
//     // I permessi sono stati concessi, puoi inizializzare la fotocamera qui
//   } else if (status.isDenied) {
//     // L'utente ha negato l'accesso alla fotocamera, puoi gestire questa situazione qui
//   } else if (status.isPermanentlyDenied) {
//     // L'utente ha permanentemente negato l'accesso alla fotocamera, puoi fornire istruzioni per attivare i permessi nelle impostazioni dell'app
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CityWander',
      debugShowCheckedModeBanner: false,
      home: SelectLanguageScene(),
      routes: {
        '/login': (context) => LoginScene(),
        '/registrazione': (context) => RegisterScene("Italiano"),
        '/registrazioneeser': (context) => RegisterEserScene(),
        '/lungomare': (context) => LungomareScene(),
        '/tour': (context) => TourScene(),
        '/recognition' : (context) => ImgRecognitionScene(),
        '/wallet' : (context) => WalletScene(),
        '/profilo' : (context) => ProfileScene(),
        '/mieitour' : (context) => MieiTourScene(),
        '/assistente' : (context) => AssistenteScene(),
        '/profilazione' : (context) => ProfilazioneScene(),
        '/locali' : (context) => LocaliScene(),
        '/infolocaleesercente' : (context) => LocaleEsercenteScene(image: HelperService.getImage("/images/test.jpeg"), title: "",description: "", address: ""),
        '/geof1' : (context) => GeofScene(numb: 1, tappa:2,tour: 3),
        '/esercente' : (context) => EsercenteHomeScene(),
        '/profiloesercente' : (context) => ProfileEsercenteScene(),
        '/localiesercente' : (context) => LocaliEsercentiScene(),
        '/registrazionelocale' : (context) => RegistrazioneLocaleScene(),
        '/locale' : (context) => LocaleScene(image: HelperService.getImage("/images/test.jpeg"), title: "",description: "", address: ""),
        '/smarttour' : (context) => SmartTourScene(tourId: 1,stato: "PROGRAMMA",),
        '/home': (context) {
          ScreenUtil.init(context,designSize:Size(390, 812));
          return HomeScene();
        },
        '/connection-failed':(context) =>ConnectionFailedScene(),
        '/seleziona-lingua':(context) =>SelectLanguageScene(),
      },
    );
  }
}
