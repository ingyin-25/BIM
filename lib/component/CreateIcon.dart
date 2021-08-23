import 'package:bim/constant.dart';
import 'package:flutter/material.dart';



class CreateIcon extends StatelessWidget {

final IconData? addicon;
final String? addgender;
CreateIcon({this.addicon,this.addgender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(addicon,size: 100),
        SizedBox(height: 10,),
        Text(
          addgender.toString(),
          style: labelTextStyle,
        ),
      ],
    );
  }
}

class RoundPlusIcon extends StatelessWidget {

  RoundPlusIcon({this.icon,this.onpress});
  final IconData? icon;
  final Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton( 
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,height: 56.0,
      ),
      fillColor: activeColor,
      shape: CircleBorder(),
      onPressed: onpress,
    );
  }
}