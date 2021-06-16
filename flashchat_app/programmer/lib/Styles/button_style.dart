import 'package:flutter/material.dart';

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
            borderRadius: BorderRadius.circular(100.0),
            //color: Color(0xffFD1657),
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
