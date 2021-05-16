import 'package:coding_profiles_app_2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:coding_profiles_app_2/Api_data/http.dart';
import 'package:coding_profiles_app_2/Styles/list_style.dart';

List studentsList = [];

class ListViewBuilder extends StatefulWidget {
  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  Future func() async {
    ApiData ad = new ApiData();
    var data = await ad.getApiData();
    studentsList = data['result'];
    //print(studentsList);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, x) {
        if (x.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              child: SizedBox(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        else if(studentsList.length==0){
          return Center(
            child:Container(
              child:Text('Internal Server Error',style:kTextStyle),
            ),
          );
        }
        return ListView.builder(
          itemCount: studentsList.length,
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
          },
        );
      },
      future: func(),
    );
  }
}
