import 'package:flash_chat/compononent/buttonlog.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const  String id= "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String myemail;
  String myPassword;
  bool showspiner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:ModalProgressHUD(
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
                onChanged: (value) {
                  myemail = value;
                  //Do something with the user input.
                },
                decoration: ktextfileddecoration.copyWith(hintText: "Enter your mail")
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  myPassword = value;
                  //Do something with the user input.
                },
                decoration: ktextfileddecoration.copyWith(hintText: "Enter yuor pasword"),
              ),
              SizedBox(
                height: 24.0,
              ),
           buttonlog(mytext: "log in",mycolor: Colors.lightBlueAccent,myfunction: ()async{
             setState(() {
               showspiner = true;
             });
             try{
               var user = await _auth.signInWithEmailAndPassword(email: myemail, password: myPassword);
               if(user!= null) {
                 Navigator.pushNamed(context, ChatScreen.id);
                 setState(() {
                   showspiner= false;
                 });


               }
               else{
                 print("non user");
               }

             }catch(e){
               print (e);
             }



           },)
            ],
          ),
        ),
      ),
    );
  }
}
