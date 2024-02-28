import 'package:flutter/material.dart';
import 'dart:ui';

class NavBarScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFFF5F5F5),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Color(0xFF00372C),
          fontSize: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/scene/images/icon1.png'),
                  onPressed: () {Navigator.pushNamed(context, '/tour');},
                ),
                Text('Tour', style: TextStyle(fontSize: 12))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/scene/images/icon2.png'),
                  onPressed: () {Navigator.pushNamed(context, '/recognition');},
                ),
                Text('Recognition', style: TextStyle(fontSize: 12))
              ],
            ),
            SizedBox(
              width: 71,
              height: 71,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 71,
                    height: 71,
                    decoration: BoxDecoration(
                      color: Color(0xFF4DA8D9),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF0072A3),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // IconButton
                  IconButton(
                    iconSize: 50,
                    icon: Image.asset('assets/scene/images/icon3.png'),
                    onPressed: () {Navigator.pushNamed(context, '/assistente');},
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/scene/images/icon4.png'),
                  onPressed: () {Navigator.pushNamed(context, '/wallet');},
                ),
                Text('Wallet', style: TextStyle(fontSize: 12))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/scene/images/icon5.png'),
                  onPressed: () {Navigator.pushNamed(context, '/profilo');},
                ),
                Text('Profile', style: TextStyle(fontSize: 12))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
