import 'package:bim/constant.dart';
import 'package:flutter/material.dart';


class Bottombutton extends StatelessWidget {

  final Function()? ontap;
  final String? buttontext;
  Bottombutton({this.ontap,this.buttontext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,      
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Center(
          child: Text(
            buttontext.toString(),
            style: TextStyle(
              color: Color(0xFF000000),
            ),
          ),
        ),
        height: buttonHeight, width: double.infinity,
        color: buttoncolor,
      ),
    );
  }
}