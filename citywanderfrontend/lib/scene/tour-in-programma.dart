import 'package:flutter/material.dart';
import 'package:myapp/AttractionContainer.dart';
import 'package:myapp/model/TappaModel.dart';
import 'package:myapp/model/TourModel.dart';
import 'package:myapp/scene/smarttour-in-programma.dart';
import 'package:myapp/service/ApiTappaService.dart';
import 'package:myapp/service/SecureStorageService.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';
import 'package:myapp/scene/navbar.dart';

import 'package:myapp/service/ApiTourService.dart';

enum FilterType {
  Programma,
  Corso,
  Archiviati,
  Tutti,
}

class MieiTourScene extends StatefulWidget {
  @override
  _MieiTourSceneState createState() => _MieiTourSceneState();
}

class _MieiTourSceneState extends State<MieiTourScene> {
  FilterType filterType = FilterType.Tutti;
  List<TourModel> tourList = List.empty();
  List<TourModel> tourListInCorso = List.empty(growable: true);
  List<TourModel> tourListArchiviati = List.empty(growable: true);
  List<TourModel> tourListInProgramma = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    loadAllTour();
  }

  loadAllTour() {
    SecureStorageService.storage.read(key: "USERNAME").then((username) {
      ApiTourService().findTourByUsername(username!).then((tourModelList) async {
        if(tourModelList!=null){
          tourList = tourModelList;
          tourList.sort(((a, b) => b.dataGenerazione.compareTo(a.dataGenerazione)));
          for(TourModel t in tourList){
            //Solo per recuperare prima immagine 
            List<TappaModel>? tappaModelList = await ApiTappaService().findTappeByTourId(t.id);
            if(tappaModelList!=null && tappaModelList.isNotEmpty){
              t.foto= tappaModelList[0].foto;
            }
            if(t.stato!.compareTo("PROGRAMMA")==0){
              tourListInProgramma.add(t);
            }else if(t.stato!.compareTo("CORSO")==0){
              tourListInCorso.add(t);
            }else if(t.stato!.compareTo("ARCHIVIATO")==0){
              tourListArchiviati.add(t);
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
          'Tour',
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
              Navigator.pushNamed(context, '/tour');
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
                                width: double.infinity,
                                height: 40 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (filterType ==
                                              FilterType.Programma) {
                                            setState(() {
                                              filterType = FilterType
                                                  .Tutti;
                                            });
                                          } else {
                                            setState(() {
                                              filterType = FilterType
                                                  .Programma;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: filterType ==
                                                    FilterType.Programma
                                                ? Color(0xfff5f5f5)
                                                : Color(0xffffffff),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4 * fem),
                                              bottomLeft:
                                                  Radius.circular(4 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'In Programma',
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
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (filterType == FilterType.Corso) {
                                            setState(() {
                                              filterType = FilterType
                                                  .Tutti;
                                            });
                                          } else {
                                            setState(() {
                                              filterType = FilterType
                                                  .Corso;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                filterType == FilterType.Corso
                                                    ? Color(0xfff5f5f5)
                                                    : Color(0xffffffff),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4 * fem),
                                              bottomLeft:
                                                  Radius.circular(4 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'In Corso',
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
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (filterType ==
                                              FilterType.Archiviati) {
                                            setState(() {
                                              filterType = FilterType
                                                  .Tutti;
                                            });
                                          } else {
                                            setState(() {
                                              filterType = FilterType
                                                  .Archiviati;
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: filterType ==
                                                    FilterType.Archiviati
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
                                              'Archiviati',
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 622 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (filterType == FilterType.Tutti)
                                for(int i = 0,counter=tourList.length; i<tourList.length; i++,counter--)
                                  AttactionContainer(
                                    image: HelperService.getImage(tourList.elementAt(i).foto),
                                    title: 'Tour ${counter}',
                                    description: 'data generazione: ${tourList.elementAt(i).dataGenerazione!.day}/${tourList.elementAt(i).dataGenerazione!.month}/${tourList.elementAt(i).dataGenerazione!.year}',
                                    fem: fem,
                                    ffem: ffem,
                                    onClickAction: ()=> Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SmartTourScene(tourId: tourList.elementAt(i).id,stato: tourList.elementAt(i).stato))))
                                    )
                              
                              else if (filterType == FilterType.Programma)
                                  for(int i = 0,counter=tourListInProgramma.length; i<tourListInProgramma.length; i++,counter--)
                                  AttactionContainer(
                                    image: HelperService.getImage(tourList.elementAt(i).foto),
                                    title: 'Tour ${counter}',
                                    description: 'data generazione: ${tourListInProgramma.elementAt(i).dataGenerazione!.day}/${tourListInProgramma.elementAt(i).dataGenerazione!.month}/${tourListInProgramma.elementAt(i).dataGenerazione!.year}',
                                    fem: fem,
                                    ffem: ffem,
                                    onClickAction: ()=> Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SmartTourScene(tourId: tourListInProgramma.elementAt(i).id,stato: tourListInProgramma.elementAt(i).stato))))
                                    )

                              else if (filterType == FilterType.Corso)
                                for(int i = 0,counter=tourListInCorso.length; i<tourListInCorso.length; i++,counter--)
                                  AttactionContainer(
                                    image: HelperService.getImage(tourList.elementAt(i).foto),
                                    title: 'Tour ${counter}',
                                    description: 'data generazione: ${tourListInCorso.elementAt(i).dataGenerazione!.day}/${tourListInCorso.elementAt(i).dataGenerazione!.month}/${tourListInCorso.elementAt(i).dataGenerazione!.year}',
                                    fem: fem,
                                    ffem: ffem,
                                    onClickAction: ()=> Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SmartTourScene(tourId: tourListInCorso.elementAt(i).id,stato: tourListInCorso.elementAt(i).stato,))))
                                  )
                              else if (filterType == FilterType.Archiviati)
                                for(int i = 0,counter=tourListArchiviati.length; i<tourListArchiviati.length; i++,counter--)
                                  AttactionContainer(
                                    image: HelperService.getImage(tourList.elementAt(i).foto),
                                    title: 'Tour ${counter}',
                                    description: 'data generazione: ${tourListArchiviati.elementAt(i).dataGenerazione!.day}/${tourListArchiviati.elementAt(i).dataGenerazione!.month}/${tourListArchiviati.elementAt(i).dataGenerazione!.year}',
                                    fem: fem,
                                    ffem: ffem,
                                    onClickAction: ()=> Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SmartTourScene(tourId: tourListArchiviati.elementAt(i).id,stato: tourListArchiviati.elementAt(i).stato))))
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
      bottomNavigationBar: NavBarScene(),
    );
  }
}
