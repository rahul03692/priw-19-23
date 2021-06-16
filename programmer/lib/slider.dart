import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

class NoonLoopingDemo extends StatelessWidget {
  NoonLoopingDemo({
    this.ccScore,
    this.hrScore,
    this.lcScore,
    this.hrPpScore,
    this.hrSiScore,
  });

  final int ccScore, hrScore, lcScore,hrPpScore,hrSiScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      //shrinkWrap: true,
      child: (
        CarouselSlider(
          items: [
            sliderScores(
              score: ccScore,
              text: "CodeChef",
              score_cal: CC_TEXT,
              imgUrl: AssetImage('images/cc_logo.png'),
            ),
            sliderScores(
              score: hrScore,
              text: "HackerRank",
              score_cal: HR_TEXT,
              imgUrl: AssetImage('images/hr_logo.png'),
            ),
            sliderScores(
              score: lcScore,
              text: "LeetCode",
              score_cal: LC_TEXT,
              imgUrl: AssetImage('images/lc_logo.png'),
            ),
            sliderScores(
              score: hrSiScore,
              text: "HR SI Basic",
              score_cal:"Smart Interviews Basic Solved",
              imgUrl:AssetImage('images/'),
            ),
            sliderScores(
              score: hrPpScore,
              text: "HR PP-1",
              score_cal:"Programmer Planet HR Solved",
              imgUrl:AssetImage('images/'),
            ),
          ],

          //Slider Container properties
          options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            //autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            //enableInfiniteScroll: true,
            //autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        )
      ),
    );
  }
}

// ignore: camel_case_types
class sliderScores extends StatelessWidget {
  // ignore: non_constant_identifier_names
  sliderScores({this.text, this.score, this.imgUrl, this.score_cal});
  final ImageProvider imgUrl;
  final int score;
  // ignore: non_constant_identifier_names
  final String text, score_cal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color(0xff2C2C34),
      ),
      child: Column(
        children: [
          SizedBox(height: 5.0,),
          WebDetails(
            text: text,
            score: score,
            imgUrl: imgUrl,
            ontap: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: EasyRichText(
                    score_cal.toString(),
                    textAlign: TextAlign.center,
                    defaultStyle:
                        kTextStyle.copyWith(fontSize: 15.0, color: Colors.teal),
                    patternList: [
                      EasyRichTextPattern(
                        targetString: '2',
                        superScript: true,
                        style: kTextStyle.copyWith(fontSize: 15.0),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
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

class WebDetails extends StatelessWidget {
  const WebDetails({
    Key key,
    @required this.text,
    @required this.score,
    @required this.ontap,
    @required this.imgUrl,
  }) : super(key: key);
  final int score;
  final String text;
  final ImageProvider imgUrl;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0),),
        color: Colors.black12,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //color: Color(0xffA13529),
              //color: Color(0xffFD1657),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.2,
                  0.9,
                ],
                colors: [
                  Color(0xffFD1657),
                  Color(0xfffc6767),
                ],
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  text,
                  style: kHeadingStyle.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.yellowAccent,
                  ),
                  child: GestureDetector(
                    child: Icon(
                      //padding: EdgeInsets.zero,
                      Icons.info,
                      color: Colors.black,
                      size: 20.0,
                    ),
                    onTap: ontap,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          AutoSizeText(
            score.toString(),
            style: kHeadingStyle,
            maxLines: 1,
            minFontSize: 10.0,
          ),
        ],
      ),
    );
  }
}
