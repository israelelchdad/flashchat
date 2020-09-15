import 'package:flutter/material.dart';
class buttonlog extends StatelessWidget {

  String mytext;
  Color mycolor;
  Function myfunction;
  buttonlog({this.mytext,this.mycolor,this.myfunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: mycolor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            myfunction();

            //Go to login screen.
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
              mytext,
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
  
}