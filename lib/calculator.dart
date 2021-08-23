import 'dart:math';



class CalculatorBrain{

  final weight;
  final height;
  double? bmi;

  CalculatorBrain({this.weight,this.height});

  String? calculatebim(){
    bmi = weight/pow(height/100, 2);
    return bmi!.toStringAsFixed(2);
  }

  String? resultdata(){
    if(bmi! >= 25){
      return 'Over weight';
    }
    else if(bmi! >= 18){
      return 'Normal';
    }
    else{
      return 'Under weight';
    }
  }

  String? remarks(){
    if(bmi! <= 25){
      return 'You are Fatty';
    }
    else if(bmi !>= 18){
      return 'Normal';
    }
    else{
      return 'You are Bamboo';
    }
  }
}