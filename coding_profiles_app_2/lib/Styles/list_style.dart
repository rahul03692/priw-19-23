import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
//import 'package:coding_profiles_app/Styles/dialog_styles.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
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
      this.overall});
  final String roll, name;
  final int ccScore, hrScore, lcScore, ibScore, pos, overall;

  // ignore: non_constant_identifier_names
  SimpleDialog Dialog(String st,String score){
    return SimpleDialog(
      title: Text(st),
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color(0xff2C2C34),
          ),
          child: EasyRichText(
            score,
            textAlign: TextAlign.center,
            defaultStyle: kTextStyle.copyWith(fontSize:15.0),
            patternList: [
              EasyRichTextPattern(
                  targetString: '2', superScript: true,style: kTextStyle.copyWith(fontSize:15.0)),
            ],
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return FlatButton(
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
                  borderRadius:BorderRadius.only(bottomLeft:Radius.circular(20.0),bottomRight:Radius.circular(20.0),topLeft:Radius.circular(20.0),topRight:Radius.circular(20.0)),
                  color: Colors.lightBlueAccent,
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex:2,
                      child:Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          color: Colors.black87//Color(0xffA13529),
                        ),
                        padding: EdgeInsets.all(5.0),
                        child:AutoSizeText(
                          pos.toString(),
                          textAlign: TextAlign.center,
                          style: kTextStyle,
                          maxLines: 1,
                          minFontSize: 10.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex:12,
                      child: Column(
                        children: [
                          AutoSizeText(
                            name,
                            textAlign: TextAlign.center,
                            style: kTopHeading.copyWith(fontFamily: 'Koho'),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            roll,
                            style: kTopHeading.copyWith(fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:10.0),
              Container(
                padding:EdgeInsets.all(10.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Expanded(
                      flex: 10,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WebDetails(text: "CodeChef",score: ccScore,ontap: (){
                                String st="CodeChef";
                                showDialog<void>(context: context, builder: (context) => Dialog(st,CC_TEXT));
                              },
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              WebDetails(text: "HackerRank",score: hrScore,ontap: (){
                                String st="HackerRank";
                                showDialog<void>(context: context, builder: (context) => Dialog(st,HR_TEXT));
                              },),
                            ],
                          ),
                          //second
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WebDetails(text: "LeetCode",score: lcScore,ontap: (){
                                String st="LeetCode";
                                showDialog<void>(context: context, builder: (context) => Dialog(st,LC_TEXT));
                              },),
                              SizedBox(
                                width: 5.0,
                              ),
                              WebDetails(text: "InterviewBit",score: ibScore,ontap: (){
                                String st="InterviewBit";
                                showDialog<void>(context: context, builder: (context) => Dialog(st,IB_TEXT));
                              },),
                            ],
                          ),
                          SizedBox(height:10.0),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              color: Color(0xffbee5d3),
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Overall Score:',
                                  style: kHeadingStyle.copyWith(color: Color(0xff2c061f)),
                                ),
                                AutoSizeText(
                                  overall.toString(),
                                  textAlign: TextAlign.center,
                                  style: kTextStyle.copyWith(color: Color(0xff2c061f)),
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
      onPressed: () {
        print("hello");
      },
    );
  }
}

class WebDetails extends StatelessWidget {
  const WebDetails({
    Key key,
    @required this.text,
    @required this.score,
    @required this.ontap,
  }) : super(key: key);
  final int score;
  final String text;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Color(0xffA13529),
          ),
          padding: EdgeInsets.all(10.0),
          child:Row(
            children: [
              Tooltip(
                message: CC_TEXT,
                child: Text(
                  text,
                  style: kHeadingStyle,
                ),
              ),
              SizedBox(width:5.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.yellowAccent,
                ),
                child:GestureDetector(
                  child:Icon(Icons.info,color:Colors.black,size: 20.0,),
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
    );
  }
}
