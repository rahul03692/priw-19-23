import 'package:flutter/material.dart';
import 'components/buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xff171721),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(
                    'https://d259t2jj6zp7qm.cloudfront.net/images/20200113133231/quiz-icon-150x150.png'
                ),
                height: 100.0,
                width: 100.0,
              ),
              RoundedButton(title:"Log In",colour: Colors.lightBlueAccent,onPressed: (){

              },),
              RoundedButton(title:"Register",colour: Colors.lightBlueAccent,onPressed: (){

              },),
            ],
          ),
        ),
      ),
    );
  }
}
