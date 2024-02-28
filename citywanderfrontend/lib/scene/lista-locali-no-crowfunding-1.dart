import 'package:flutter/material.dart';
import 'package:myapp/model/RestaurantModel.dart';
import 'package:myapp/scene/info-locale.dart';
import 'dart:async';
import 'package:myapp/scene/navbar.dart';
import 'package:myapp/service/ApiRestaurantService.dart';
import 'package:myapp/utils.dart';

class LocaliScene extends StatefulWidget {
  @override
  _LocaliSceneState createState() => _LocaliSceneState();
}

class _LocaliSceneState extends State<LocaliScene> {
  final PageController _pageController = PageController();
  Timer? _timer;
  List<RestaurantModel> restaurantList = List.empty();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        _pageController.animateToPage(
          nextPage % 6,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
    loadRestaurants();
  }

  Future<void>? loadRestaurants(){
    return ApiRestaurantService().findTopRistoranti(50).then((ristoranteModelList) {
        if (ristoranteModelList != null) {
          restaurantList = ristoranteModelList;
          for(var v in restaurantList){
            if(v.nome!.length>30){
              v.nome = v.nome!.substring(0,30);
              v.nome = v.nome! + "...";
            }
            if(v.descrizione!.length>80){
              v.descrizione = v.descrizione!.substring(0,80);
              v.descrizione = v.descrizione! + "...";
            }
         }
         setState(() {}); 
        }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget buildCard(
      String title, String subtitle,String partialDescription, String fullDescription, String imagePath) {
    double screenWidth = MediaQuery.of(context).size.width;
    double baseWidth = 390;
    double fem = screenWidth / baseWidth;
    double ffem = fem * 0.97;

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => LocaleScene(image:HelperService.getImageFromWeb(imagePath),title:title,description: fullDescription,address: subtitle))));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(20 * fem, 20 * fem, 20 * fem, 0 * fem),
          width: 390 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(8 * fem),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20 * fem),
              Center(
                child: Container(
                  width: 334 * fem,
                  height: 266 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: HelperService.getImageFromWeb(imagePath),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20 * fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff0d1015),
                      ),
                    ),
                    SizedBox(height: 8 * fem),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff848484),
                      ),
                    ),
                    SizedBox(height: 8 * fem),
                    Text(
                      partialDescription,
                      style: TextStyle(
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: 10 * fem),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  double cardHeight = screenHeight * 0.57;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista locali',
          style: TextStyle(
            fontSize: 20,
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
              Navigator.pop(context);
            },
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, -1),
              end: Alignment(0, 1),
              colors: <Color>[Color(0x0000372c), Color(0xff00372c)],
              stops: <double>[0, 0.984],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100 * screenWidth / 390),
            SizedBox(
              height: cardHeight,
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  for(var restaurant in restaurantList)
                    buildCard(
                      restaurant.nome!,
                      restaurant.indirizzo!,
                      restaurant.descrizione!,
                      restaurant.descrizioneCompleta!,
                      restaurant.foto!,
                    )
                ],
              ),
              ),
              SizedBox(height: 100 * MediaQuery.of(context).size.width / 390),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBarScene(),
    );
  }
}
