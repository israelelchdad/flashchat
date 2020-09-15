import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/compononent/buttonlog.dart';
import 'package:flash_chat/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static const  String id = "registation_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String pasword;
  bool showspiner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspiner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(tag: "logo",
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                    //Do something with the user input.
                  },
                  decoration: ktextfileddecoration.copyWith(hintText: "Enter your mail")
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  pasword =value;
                  //Do something with the user input.
                },
                decoration: ktextfileddecoration.copyWith(hintText: "Enter yuor pasword"),
              ),
              SizedBox(
                height: 24.0,
              ),
              buttonlog(mytext: "registar",mycolor: Colors.lightBlueAccent,myfunction: () async{
                setState(() {
                  showspiner = true;
                });
                try{
                  final newuser = await _auth.createUserWithEmailAndPassword(email:email, password: pasword);
                  if(newuser!= null){
                    Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      showspiner = false;
                    });
                  }
                }
                catch(e){
                  print(e);
                }

              },)
            ],
          ),
        ),
      ),
    );
  }
}
