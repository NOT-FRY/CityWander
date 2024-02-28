import 'package:flutter/material.dart';
import 'package:myapp/AttractionContainer.dart';
import 'package:myapp/model/RestaurantModel.dart';
import 'package:myapp/scene/info-locale-esercente.dart';
import 'package:myapp/service/ApiRestaurantService.dart';
import 'package:myapp/service/SecureStorageService.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class LocaliEsercentiScene extends StatefulWidget {
  @override
  _LocaliEsercentiSceneState createState() => _LocaliEsercentiSceneState();
}

class _LocaliEsercentiSceneState extends State<LocaliEsercentiScene> {
  List<RestaurantModel> restaurantList = List.empty();

  @override
  void initState() {
    super.initState();
    loadAllRestaurant();
  }

  loadAllRestaurant() {
    SecureStorageService.storage.read(key: "USERNAME").then((username) {
      ApiRestaurantService().findRistorantiByUsername(username!).then((restaurantModelList) {
        if(restaurantModelList!=null){
          restaurantList = restaurantModelList;
            for(var v in restaurantList){
              if(v.descrizione!.length>80){
                v.descrizione = v.descrizione!.substring(0,80);
                v.descrizione = v.descrizione! + "...";
              }
            }
          setState(() {});
        }
      });
    
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
          'I miei locali',
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
        titleSpacing: 0.0,
      ),
      body: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: 844 * fem,
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0 * fem,
                child: Container(
                  width: 390 * fem,
                  height: 724 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 724 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                for(RestaurantModel ristorante in restaurantList)
                                    AttactionContainer(
                                      image: HelperService.getImageFromWeb(ristorante.foto),
                                      title: ristorante.nome!,
                                      description:
                                          ristorante.descrizione!,
                                      fem: fem,
                                      ffem: ffem,
                                      onClickAction: ()=> Navigator.of(context).push(MaterialPageRoute(builder: ((context) => LocaleEsercenteScene(image:HelperService.getImageFromWeb(ristorante.foto),title:ristorante.nome!,description: ristorante.descrizioneCompleta!,address: ristorante.indirizzo!))))
                                      ),
                                      SizedBox(height: 20 * fem),
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
        ),
      ),
    );
  }
}
