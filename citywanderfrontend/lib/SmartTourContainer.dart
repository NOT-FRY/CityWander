import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class SmartTourContainer extends StatelessWidget {
  final String dayTitle;
  final int itemCount;
  final List<String> attractionTitles;
  final List<String> attractionImages;
  final List<String> attractionDescriptions;
  final double scale;
  final double textScaleFactor;

  const SmartTourContainer({
    required this.itemCount,
    required this.dayTitle,
    required this.attractionTitles,
    required this.attractionImages,
    required this.attractionDescriptions,
    required this.scale,
    required this.textScaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10 * scale),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(  //Rimosso numero della giornata, troppo complesso
          //   dayTitle,
          //   style: GoogleFonts.ptSans(
          //     fontSize: 18 * textScaleFactor,
          //     fontWeight: FontWeight.w400,
          //     color: Color(0xff00372c),
          //   ),
          // ),
          ListView.builder(
            itemCount: itemCount,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 8 * scale, 0, 26 * scale),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8 * scale),
                      width: 80 * scale,
                      height: 80 * scale,
                      child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * scale),
                        color: Color(0xffd9d9d9),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: HelperService.getImage(attractionImages[index])
                  ),
                ),
              ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.ptSans(
                            fontSize: 18 * textScaleFactor,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0d1015),
                          ),
                          children: [
                            TextSpan(
                              text: '${attractionTitles[index]}\n',
                              style: GoogleFonts.ptSans(
                                fontSize: 18 * textScaleFactor,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff0d1015),
                              ),
                            ),
                            TextSpan(
                              text: attractionDescriptions[index],
                              style: GoogleFonts.ptSans(
                                fontSize: 14 * textScaleFactor,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0d1015),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
