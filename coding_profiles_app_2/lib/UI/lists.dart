import 'package:flutter/material.dart';
import 'package:coding_profiles_app_2/UI/listViewBuilder.dart';


class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
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
        child:ListViewBuilder(),
      ),
    );
  }
}


