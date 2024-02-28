import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:myapp/scene/navbar.dart';
import 'package:myapp/service/ApiMappa.dart';

class TourScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fem = screenWidth / 390;
    double ffem = fem * 0.97;
    double mapHeight = screenHeight * 0.7;

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
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        titleSpacing: 0.0, // Imposta lo spazio tra il titolo e l'icona a 0
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(5 * ffem),
              decoration: BoxDecoration(
                color: Color(0xfff5f5f5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/mieitour');
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Visualizza i miei tour',
                              style: TextStyle(
                                fontSize: 22 * ffem,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: mapHeight, // Imposta l'altezza desiderata
                    child: StreamBuilder<LatLng>(
                      stream: ApiMappa().getCurrentLocationStream(), // Stream che fornisce le nuove posizioni
                      initialData: LatLng(40.6824408, 14.7680961), // Posizione iniziale predefinita
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return FlutterMap(
                            options: MapOptions(
                              center: snapshot.data!,
                              zoom: 15.0,
                            ),
                            layers: [
                              TileLayerOptions(
                                minZoom: 10,
                                maxZoom: 18,
                                urlTemplate:
                                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                subdomains: ['a', 'b', 'c'],
                              ),
                              MarkerLayerOptions(
                                markers: [
                                  Marker(
                                    width: 80.0,
                                    height: 80.0,
                                    point: snapshot.data!,
                                    builder: (ctx) => Container(
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                        size: 40.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Center(child: CircularProgressIndicator()); // Mostra un indicatore di caricamento se non ci sono ancora dati
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: NavBarScene(),
    );
  }
}
