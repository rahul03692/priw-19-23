import 'package:flutter/material.dart';
import 'package:coding_profiles_app_2/Api_data/http.dart';
import 'package:coding_profiles_app_2/Styles/list_style.dart';
import 'package:coding_profiles_app_2/constants/constants.dart';

List studentsList = [];


// ignore: must_be_immutable
class ListViewBuilderWithId extends StatefulWidget {
  ListViewBuilderWithId({this.rollno});
  final String rollno;
  @override
  _ListViewBuilderWithIdState createState() => _ListViewBuilderWithIdState();
}

class _ListViewBuilderWithIdState extends State<ListViewBuilderWithId> {
  Future func() async {
    ApiData ad = new ApiData();
    var data = await ad.getApiData();
    studentsList = data['result'];
    return studentsList;
    //print(studentsList);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
      // ignore: missing_return
      builder: (context, x) {
        int f = 0,k = 0;
        if (x.hasData) {
          k=1;
          return ListView.builder(
              itemCount: studentsList.length,
              // ignore: missing_return
              itemBuilder: (context, index) {
                var st = studentsList[index];
                int pos = index + 1;
                String roll = st['roll'];
                String name = st['name'];
                int ccScore = st['codechefSolved'];
                int hrScore = st['hackerrankSolved'];
                int ibScore = st['interviewbitSolved'];
                int lcScore = st['leetcodeSolved'];
                int overall = st['overall'];
                if (widget.rollno == roll) {
                  f = 1;
                  return ListStyles(
                    pos: pos,
                    roll: roll,
                    name: name,
                    ccScore: ccScore,
                    hrScore: hrScore,
                    ibScore: ibScore,
                    lcScore: lcScore,
                    overall: overall,
                  );
                } else {
                  if (index == studentsList.length - 1 && f == 0) {
                    return Center(
                      child: Container(
                        child: SizedBox(
                          child: Column(
                            children: [
                              Text(
                                'No Data Found',
                                style: kTextStyle,
                              ),
                              Image(
                                image: AssetImage('images/sad.png'),
                              ),
                              FlatButton(
                                padding: EdgeInsets.all(10.0),
                                child: Text('Back', style: TextStyle(
                                  color: Colors.white,
                                ),),
                                color: Colors.lightBlueAccent,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else
                    return Container();
                }
              });
        }
        else if (studentsList.length == 0 && k == 1) {
          return Center(
            child: Container(
              child: Text('Internal Server Error', style: kTextStyle),
            ),
          );
        }
        return Center(
          child: Container(
            child: SizedBox(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
      future: func(),
    );
  }
}
