import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/ApiConstants.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

double calculateProportionalWidth(BuildContext context, double width) {
  final mediaQuery = MediaQuery.of(context);
  return width * (mediaQuery.size.width / 390); // 390 è la larghezza di riferimento
}

double calculateProportionalHeight(BuildContext context, double height) {
  final mediaQuery = MediaQuery.of(context);
  return height * (mediaQuery.size.height / 812); // 812 è l'altezza di riferimento
}

TextStyle SafeGoogleFont(
  String fontFamily, {
  TextStyle? textStyle,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  try {
    return GoogleFonts.getFont(
      fontFamily,
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  } catch (ex) {
    return GoogleFonts.getFont(
      "Source Sans Pro",
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}
class HelperService{

 static  Map<String, String> buildHeaders({String? accessToken}) {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  static ImageProvider getImage(imagePath) {

    // try{
    // return Image.network('${ApiConstants.baseUrl}$imagePath', 
    //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    //      return CircularProgressIndicator();
    //   }
    // ).image;
    // }catch(e){
    //   log(e.toString());
    //   //TODO immagine segnaposto
    //   return Image.asset('assets/scene/images/icone-U8U.png').image;
    // }

    return CachedNetworkImageProvider('${ApiConstants.baseUrl}$imagePath',
      errorListener: (_) => const CircularProgressIndicator()
    );
    

  }

    static ImageProvider getImageFromWeb(url) {

    // try{
    // return Image.network(url, 
    //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    //      return CircularProgressIndicator();
    //   }
    // ).image;
    // }catch(e){
    //   log(e.toString());
    //   //TODO immagine segnaposto
    //   return Image.asset('assets/scene/images/icone-U8U.png').image;
    // }
        return CachedNetworkImageProvider(url,
      errorListener: (_) => const CircularProgressIndicator()
    );

  }
  
}