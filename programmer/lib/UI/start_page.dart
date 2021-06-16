import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:coding_profiles_app_2/UI/lists.dart';
import 'package:coding_profiles_app_2/UI/searched_lists.dart';
import 'package:coding_profiles_app_2/constants/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:coding_profiles_app_2/Styles/button_style.dart';


String roll = "";

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final fieldText = TextEditingController();
  final textFieldValueHolder = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.0125,
                  0.5,
                  0.9,
                ],
                colors: [
                  Color(0xffFFCC70),
                  Color(0xff4158D0),
                  Color(0xffC850C0),
                ],
              ),
          ),
          child: ListView(
            children: [
              SizedBox(height: 100.0,),
              Column(
                children: [
                  Image.asset(
                    'images/appImg.png',
                    height: 100.0,
                    width: 100.0,
                    //color: Colors.black,
                  ),
                  Container(
                    child: AutoSizeText(
                      'Programmer',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontFamily: 'Ubuntu',
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  Container(
                    child: AutoSizeText(
                      '.Planet',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (value) {
                        roll = value;
                      },

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                      ),
                      controller: fieldText,
                      cursorColor: Colors.white,
                      decoration: kTextFieldDecoration.copyWith(
                        suffixIcon: Container(
                          margin: EdgeInsets.all(10.0),
                          //padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            //color: Color(0xff25d366),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [
                                0.2,
                                0.9,
                              ],
                              colors: [
                                Color(0xffec008c),
                                Color(0xfffc6767),
                              ],
                            ),

                          ),
                          child:IconButton(
                            icon: Icon(Icons.send,color: Colors.white,size: 20.0,),
                            onPressed: () {
                              roll = roll.trim();
                              if (roll.length != 10) {
                                return Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "WARNING",
                                  desc: "Please Enter Valid Roll No.",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Retry",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        fieldText.clear();
                                        roll="";
                                        Navigator.pop(context);
                                      },
                                      width: 120,
                                    )
                                  ],
                                ).show();
                              }
                              roll = roll.toUpperCase();
                              fieldText.clear();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchedLists(
                                    rollno: roll,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  Buttons(
                    text: 'Leaderboard',
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lists(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// Column(
// children: [
// Container(
// //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
// margin: EdgeInsets.all(10.0),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(100.0),
// color: Color(0xffFD1657),
// ),
// child: FlatButton(
// onPressed: () {},
// child: new Text('Ask a Question',
// style: kHeadingStyle),
// ),
// ),
// ],
// ),