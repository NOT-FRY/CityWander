import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/ApiConstants.dart';
import 'package:myapp/AttractionContainer.dart';
import 'package:myapp/model/RestaurantModel.dart';
import 'package:myapp/model/TappaModel.dart';
import 'package:myapp/scene/attrazione.dart';
import 'package:myapp/scene/info-locale.dart';
import 'package:myapp/service/ApiRestaurantService.dart';
import 'package:myapp/service/ApiTappaService.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/scene/navbar.dart';

enum FilterType {
  Attrazioni,
  Ristoranti,
  Tutti, // Aggiunto un terzo stato per mostrare tutti i contenuti
}

class HomeScene extends StatefulWidget {
  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene> {
  FilterType filterType = FilterType.Tutti;
  List<TappaModel> tappeList = List.empty();
  List<RestaurantModel> restaurantList = List.empty();
  var allAttractionList = List.empty(growable: true);


  @override
  void initState() {
    super.initState();
    loadAttractions();
  }

  void loadAttractions() async{
    await loadTappe();
    await loadRestaurants();
    allAttractionList.addAll(tappeList);
    allAttractionList.addAll(restaurantList);
    allAttractionList.shuffle();
    setState(() {});
  }

  Future<void>? loadTappe() {
    return ApiTappaService().getAllTappe().then((tappaModelList) {
      if (tappaModelList != null) {
        tappeList = tappaModelList;
        for(var v in tappeList){
          if(v.descrizione!.length>80){
            v.descrizione = v.descrizione!.substring(0,80);
            v.descrizione = v.descrizione! + "...";
          }
        }
        tappeList.shuffle();
      }
    });
  }

  Future<void>? loadRestaurants() {
    return ApiRestaurantService().findTopRistoranti(ApiConstants.LIMITE_RISTORANTI).then((ristoranteModelList) {
        if (ristoranteModelList != null) {
          restaurantList = ristoranteModelList;
          for(var v in restaurantList){
            if(v.descrizione!.length>80){
              v.descrizione = v.descrizione!.substring(0,80);
              v.descrizione = v.descrizione! + "...";
            }
          }
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double fem = screenWidth / 390;
        double ffem = fem * 0.97;
        return Container(
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
                  top: 40 * fem,
                  child: Container(
                    width: 390 * fem,
                    height: 724 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32 * fem),
                              topRight: Radius.circular(32 * fem),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 15 * fem),
                                  constraints: BoxConstraints(
                                    maxWidth: 300 * fem,
                                  ),
                                  child: Text(
                                    'Scopri le gemme nascoste e le attrazioni della zona',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'PT Sans',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2925 * ffem / fem,
                                      color: Color(0xff00372c),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (filterType ==
                                                FilterType.Attrazioni) {
                                              setState(() {
                                                filterType = FilterType
                                                    .Tutti; // Deseleziona il filtro
                                              });
                                            } else {
                                              setState(() {
                                                filterType = FilterType
                                                    .Attrazioni; // Seleziona il filtro
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: filterType ==
                                                      FilterType.Attrazioni
                                                  ? Color(0xfff5f5f5)
                                                  : Color(0xffffffff),
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(4 * fem),
                                                bottomLeft:
                                                    Radius.circular(4 * fem),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Attrazioni',
                                                style: SafeGoogleFont(
                                                  'PT Sans',
                                                  fontSize: 16 * ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2925 * ffem / fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (filterType ==
                                              FilterType.Ristoranti) {
                                            setState(() {
                                              filterType = FilterType
                                                  .Tutti; // Deseleziona il filtro
                                            });
                                          } else {
                                            setState(() {
                                              filterType = FilterType
                                                  .Ristoranti; // Seleziona il filtro
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: 195 * fem,
                                          height: 40 * fem,
                                          decoration: BoxDecoration(
                                            color: filterType ==
                                                    FilterType.Ristoranti
                                                ? Color(0xfff5f5f5)
                                                : Color(0xffffffff),
                                            borderRadius: BorderRadius.only(
                                              topRight:
                                                  Radius.circular(4 * fem),
                                              bottomRight:
                                                  Radius.circular(4 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Ristoranti',
                                              style: SafeGoogleFont(
                                                'PT Sans',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2925 * ffem / fem,
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
                        Container(
                          // homapagemQG (1205:368)
                          width: double.infinity,
                          height: 617 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                if(filterType == FilterType.Tutti)
                                  for(var attraction in allAttractionList)
                                    AttactionContainer(
                                      image: attraction is TappaModel ? HelperService.getImage(attraction.foto) : HelperService.getImageFromWeb(attraction.foto),
                                      title: attraction.nome!,
                                      description:
                                          attraction.descrizione!,
                                      fem: fem,
                                      ffem: ffem,
                                      onClickAction: ()=> attraction is TappaModel ? Navigator.of(context).push(MaterialPageRoute(builder: ((context) => AttrazioneScene(
                                        image: HelperService.getImage(attraction.foto),
                                        title: attraction.nome!,
                                        description: attraction.descrizioneCompleta!
                                        ))))
                                        :
                                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => LocaleScene(image:HelperService.getImageFromWeb(attraction.foto),title:attraction.nome!,description: attraction.descrizioneCompleta!,address: attraction.indirizzo!))))
                                      )
                                else if(filterType == FilterType.Attrazioni)
                                  for(TappaModel tappa in tappeList)
                                    AttactionContainer(
                                      image: HelperService.getImage(tappa.foto),
                                      title: tappa.nome!,
                                      description:
                                          tappa.descrizione!,
                                      fem: fem,
                                      ffem: ffem,
                                      onClickAction: ()=> Navigator.of(context).push(MaterialPageRoute(builder: ((context) => AttrazioneScene(image: HelperService.getImage(tappa.foto), title: tappa.nome!, description: tappa.descrizioneCompleta!))))
                                      )
                                else if (filterType == FilterType.Ristoranti)
                                  for(RestaurantModel ristorante in restaurantList)
                                    AttactionContainer(
                                      image: HelperService.getImageFromWeb(ristorante.foto),
                                      title: ristorante.nome!,
                                      description:
                                          ristorante.descrizione!,
                                      fem: fem,
                                      ffem: ffem,
                                      onClickAction: ()=> Navigator.of(context).push(MaterialPageRoute(builder: ((context) => LocaleScene(image:HelperService.getImageFromWeb(ristorante.foto),title:ristorante.nome!,description: ristorante.descrizioneCompleta!,address: ristorante.indirizzo!))))
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
        );
      }),
      bottomNavigationBar: NavBarScene(),
    );
  }
}
