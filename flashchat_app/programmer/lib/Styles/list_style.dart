import 'package:coding_profiles_app_2/slider.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:coding_profiles_app_2/constants/constants.dart';

class ListStyles extends StatelessWidget {
  ListStyles(
      {this.pos,
      this.roll,
      this.name,
      this.ccScore,
      this.hrScore,
      this.lcScore,
      this.ibScore,
      this.hrSiScore,
      this.hrPpScore,
      this.overall});
  final String roll, name;
  final int ccScore,
      hrScore,
      lcScore,
      ibScore,
      pos,
      overall,
      hrSiScore,
      hrPpScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color(0xff2C2C34),
          ),
          //padding: EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.2,
                      0.9,
                    ],
                    colors: [
                      //Color(0xffFFCC70),
                      Color(0xff4158D0),
                      Color(0xffC850C0),
                    ],
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                            color: Colors.black87 //Color(0xffA13529),
                            ),
                        padding: EdgeInsets.all(5.0),
                        child: AutoSizeText(
                          pos.toString(),
                          textAlign: TextAlign.center,
                          style: kTextStyle,
                          maxLines: 1,
                          minFontSize: 10.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      flex: 12,
                      child: Column(
                        children: [
                          AutoSizeText(
                            name,
                            textAlign: TextAlign.center,
                            style: kTopHeading.copyWith(
                              fontFamily: 'Ubuntu',
                              color: Color(0xffffea54),
                              letterSpacing: 1,
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            roll,
                            style: kTopHeading.copyWith(
                              fontFamily: 'Ubuntu',
                              fontSize: 18.0,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              //NoonLoopingDemo(),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Expanded(
                      flex: 10,
                      child: Column(
                        children: [
                          SizedBox(
                            child: NoonLoopingDemo(
                              ccScore: ccScore,
                              hrScore: hrScore,
                              lcScore: lcScore,
                              hrSiScore:hrSiScore,
                              hrPpScore:hrPpScore,
                            ),
                            height: 150.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Color(0xffbee5d3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Overall Score :',
                                  style: kHeadingStyle.copyWith(
                                      color: Color(0xff2c061f)),
                                ),
                                AutoSizeText(
                                  overall.toString(),
                                  textAlign: TextAlign.center,
                                  style: kTextStyle.copyWith(
                                      color: Color(0xff2c061f),fontSize: 22.0),
                                  maxLines: 1,
                                  minFontSize: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     WebDetails(
//       text: "CodeChef",
//       score: ccScore,
//       ontap: () {
//         String st = "CodeChef";
//         showDialog<void>(
//             context: context,
//             builder: (context) =>
//                 Dialog(st, CC_TEXT));
//       },
//     ),
//     SizedBox(
//       width: 5.0,
//     ),
//     WebDetails(
//       text: "LeetCode",
//       score: lcScore,
//       ontap: () {
//         String st = "LeetCode";
//         showDialog<void>(
//             context: context,
//             builder: (context) =>
//                 Dialog(st, LC_TEXT));
//       },
//     ),
//   ],
// ),
// //second
// SizedBox(
//   height: 10.0,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     WebDetails(
//       text: "Hacker Rank",
//       score: hrScore,
//       ontap: () {
//         String st = "HackerRank";
//         showDialog<void>(
//             context: context,
//             builder: (context) =>
//                 Dialog(st, HR_TEXT));
//       },
//     ),
//   ],
// ),
