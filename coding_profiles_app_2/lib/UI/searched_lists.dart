import 'package:flutter/material.dart';
import 'package:coding_profiles_app_2/UI/listViewBuilderWithId.dart';



class SearchedLists extends StatefulWidget {
  SearchedLists({this.rollno});
  final String rollno;
  @override
  _SearchedListsState createState() => _SearchedListsState();
}

class _SearchedListsState extends State<SearchedLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores List'),
        centerTitle: true,
        backgroundColor: Color(0xff171721),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Color(0xff171721),
        child:ListViewBuilderWithId(rollno: widget.rollno,),
      ),
    );
  }
}


