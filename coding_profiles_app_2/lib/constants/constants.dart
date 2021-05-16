import 'package:flutter/material.dart';


const kTextStyle = TextStyle(
  fontSize: 25.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kHeadingStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kTopHeading=TextStyle(
  fontSize: 25.0,
  color: Color(0xff19181a),
  fontWeight: FontWeight.bold,
);

const HR_TEXT="DS + Algo";
const CC_TEXT="CCPS* 10 + (CCR - 1300)2/30";
const IB_TEXT="IBS/3";
const LC_TEXT="20 * LCPS";

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a Roll No',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);