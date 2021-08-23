import 'package:bim/component/button.dart';
import 'package:bim/constant.dart';
import 'package:bim/screen/input_page.dart';
import 'package:flutter/material.dart';
import '../component/ReusableCard.dart';


class Result extends StatelessWidget {

  Result({this.mybmi,this.myresultdata,this.myremarks});
final String? myresultdata;
final String? mybmi;
final String? myremarks;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIM Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Your Result',style: labelResult,),
          Expanded(
            child: ReusableCard(
              mycolor: inactiveColor,
              readCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(myresultdata.toString(),style: labelResultTitle,),
                  Text(mybmi.toString(),style: bimstyle,),
                  Text('You have a normal weight. Way to go.',style: labelTextStyle,),
                ],
              ),
            ),
          ),
          Bottombutton(
            // ontap: (){Navigator.pushNamed(context, '/');},
            buttontext: 'ReCalculate',
            ontap: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context){
                    return InputPage();
                  },
                ),
              );
            },
           ),
        ],
      ),
    );
  }
}