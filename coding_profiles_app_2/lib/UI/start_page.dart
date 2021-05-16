import 'package:flutter/material.dart';
import 'package:coding_profiles_app_2/UI/lists.dart';
import 'package:coding_profiles_app_2/UI/searched_lists.dart';
import 'package:coding_profiles_app_2/constants/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

String roll = "";

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final fieldText = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          color: Color(0xff463E5C),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage(
                      'images/appImg.png',
                    ),
                    height: 100.0,
                    width: 100.0,
                    color: Colors.black,
                  ),
                  Container(
                    child: Text(
                      'Programmer.Planet',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          onChanged: (value) {
                            roll = value;
                          },
                          controller: fieldText,
                          decoration: kTextFieldDecoration.copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                setState(() {
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
                                });
                              },
                            ),
                          ),
                        ),
                      ),
//                      Center(
//                        child: Text(
//                          'Wanna See Full List',
//                          style: TextStyle(
//                            fontSize: 20.0,
//                            color: Colors.black,
//                          ),
//                        ),
//                      ),
//                      SizedBox(
//                        height: 10.0,
//                      ),
//                      Center(child: Text('Click below Button')),
                      Buttons(
                        text: 'Full List',
                        onpress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Lists(),
                            ),
                          );
                        },
                      ),
                      Column(
                        children: [
                          Container(
                            //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Color(0xffFD1657),
                            ),
                            child: FlatButton(
                              onPressed: () {},
                              child: new Text('Ask a Question',
                                  style: kHeadingStyle),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  Buttons({this.text, this.onpress});
  final String text;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlatButton(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Color(0xff002280),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: onpress,
        //elevation : 5,
      ),
    );
  }
}
