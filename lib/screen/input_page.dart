import 'package:bim/calculator.dart';
import 'package:bim/component/button.dart';
import 'package:bim/screen/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/ReusableCard.dart';
import '../component/CreateIcon.dart';
import '../constant.dart';


enum gender {male,female}
gender? selectitem;

class InputPage extends StatefulWidget {
  const InputPage({ Key? key }) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int heightval=180;
  int weightval=60;
  int ageval=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: (){setState(() {
                        selectitem=gender.male;
                      });
                    },
                    mycolor: selectitem==gender.male?activeColor:inactiveColor,
                    readCard: CreateIcon(
                      addicon: FontAwesomeIcons.mars, 
                      addgender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: (){
                      setState(() {
                        selectitem=gender.female;
                      });
                    },
                    mycolor: selectitem==gender.female?activeColor:inactiveColor,
                    readCard: CreateIcon(
                      addicon: FontAwesomeIcons.venus, 
                      addgender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: ReusableCard(
              mycolor: inactiveColor,
              readCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(heightval.toString(),style: labelNumStyle,),
                      Text('cm',style: labelNumStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 50.0,
                      ),
                      thumbColor: Color(0xFFFFFFFF),
                      overlayColor: Color(0x30EB1555),
                    ),
                    child: Slider(
                      value: heightval.toDouble(),
                        min: 120.0,
                        max: 220.0, 
                      onChanged: (double newValue){
                        setState(() {
                          heightval=newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: 
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    mycolor: inactiveColor,
                    readCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',style: labelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(weightval.toString(),style: labelNumStyle,),
                            Text('Kg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundPlusIcon(
                              icon:FontAwesomeIcons.plus,
                              onpress: (){setState(() {weightval++;});},
                            ),
                            SizedBox(width: 10.0,),
                            RoundPlusIcon(
                              icon: FontAwesomeIcons.minus,
                              onpress: (){setState(() {weightval--;});},
                            )
                          ],//Children
                        ),
                      ],//Children
                    ),
                  ),
                ),
                Expanded(child: 
                  Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          mycolor: inactiveColor,
                          readCard: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Age',style: labelTextStyle,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(ageval.toString(),style: labelNumStyle,),
                                  Text('years'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundPlusIcon(
                                    icon:FontAwesomeIcons.plus,
                                    onpress: (){setState(() {ageval++;});
                                    },
                                  ),
                                  SizedBox(width: 10.0,),
                                  RoundPlusIcon(
                                    icon: FontAwesomeIcons.minus,
                                    onpress: (){setState(() {ageval--;});
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],//children
            ),
          ),
          Bottombutton(
            ontap: (){
              CalculatorBrain calculate=CalculatorBrain(weight: weightval, height: heightval);
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (contex){
                    return Result(
                      mybmi: calculate.calculatebim(),
                      myresultdata: calculate.resultdata(),
                      myremarks: calculate.remarks(),
                    );
                  },
                ),
              );
            },
            buttontext: 'CALCULATE BMI',
          ),
        ],
      ),
    );
  }
}







