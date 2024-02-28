import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:myapp/scene/attrazione.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/ApiConstants.dart';

class AttactionContainer extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final double fem;
  final double ffem;
  final Function onClickAction;

  AttactionContainer({
    required this.image,
    required this.title,
    required this.description,
    required this.fem,
    required this.ffem,
    required this.onClickAction
  });

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: () {onClickAction();
      },    
    child: Container(
        margin: EdgeInsets.fromLTRB(10 * fem, 20 * fem, 8 * fem, 0 * fem),
        width: double.infinity,
        height: 80 * fem,
        child: Row(
          children: [
            SizedBox(
              width: 80 * fem,
              height: 80 * fem,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xffd9d9d9),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: image
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8 * fem),
                child: RichText(
                  text: TextSpan(
                    style: SafeGoogleFont(
                      'PT Sans',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2925 * ffem / fem,
                      color: Color(0xff0d1015),
                    ),
                    children: [
                      TextSpan(
                        text: '$title\n',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2925 * ffem / fem,
                          color: Color(0xff0d1015),
                        ),
                      ),
                      TextSpan(
                        text: '$description',
                        style: SafeGoogleFont(
                          'PT Sans',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2925 * ffem / fem,
                          color: Color(0xff0d1015),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
      ); 
  }
}