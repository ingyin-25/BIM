import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color? mycolor;
  final Widget? readCard;
  final Function()? onpress;

  ReusableCard({this.mycolor,this.readCard,this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: readCard,
        width: 200,height: 200,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mycolor,
        ),
      ),
    );
  }
}
