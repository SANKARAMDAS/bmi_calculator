import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.Weight, required this.Height});

  final int Height;
  final int Weight;

  double _bmi;

  String calculateBMI(){
    _bmi = Weight / pow(Height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi > 18.5){
      return 'Normal';
    } else {
      return 'Under Weigth';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25) {
      return 'Your weight is higher than normal';
    } else if (_bmi > 18.5){
      return 'Your weight is normal';
    } else {
      return 'Your weight is lower than normal';
    }
  }

}