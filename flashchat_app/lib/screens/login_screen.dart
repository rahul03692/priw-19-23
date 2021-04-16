import 'package:flutter/material.dart';
import 'package:flashchat_app/components/buttons.dart';
import 'package:flashchat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, pwd;
  bool loading=false;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextField.copyWith(hintText: 'Enter your Email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  pwd = value;
                },
                decoration: kTextField.copyWith(hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Buttons(
                color: Colors.lightBlueAccent,
                text: 'Log In',
                onpress: () async{
                  setState(() {
                    loading=true;
                  });
                  try{
                    final user= await _auth.signInWithEmailAndPassword(email: email, password: pwd);
                    if(user!=null) Navigator.pushNamed(context,ChatScreen.id);
                    setState(() {
                      loading=false;
                    });
                  }
                  catch(e){
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Invalid",
                      desc: "Password or Username is Invalid",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: (){
                            setState(() {
                              loading=false;
                              Navigator.pop(context);
                            });
                          },
                            width: 120
                        )
                      ],
                    ).show();
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
