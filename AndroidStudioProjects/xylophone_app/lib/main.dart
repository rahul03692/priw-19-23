import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  void audio(int x){
    final player= AudioCache();
    player.play('assets/note$x.wav');
  }
  

  Expanded expand({Color s,int x}){
    return Expanded(
      child : FlatButton(
        color: s,
        onPressed: (){
          audio(x);
        }, child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              expand(s: Colors.red,x:1),
              expand(s: Colors.orange,x:2),
              expand(s: Colors.yellow,x:3),
              expand(s: Colors.blue,x:4),
              expand(s: Colors.blueGrey,x:5),
              expand(s: Colors.teal,x:6),
            ],
          ),
        ),
      ),
    );
  }
}
