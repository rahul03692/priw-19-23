import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {

  final bool check;
  final String text;
  final Function onchange;
  final Function longpress;

  ListTiles({this.check,this.text,this.onchange,this.longpress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text,
      style: TextStyle(
        decoration: check ? TextDecoration.lineThrough: null),
      ),
      onLongPress: longpress,
      trailing: Checkbox(value: check, onChanged: onchange),
    );
  }
}
