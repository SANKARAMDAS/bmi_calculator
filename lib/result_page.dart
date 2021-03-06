import 'package:bmi_calculator/buttom_button.dart';
import 'package:bmi_calculator/card_contain.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.resultText, required this.bmiResult, required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kChildColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),
                  style: kResultTextStyle,),
                  Text(bmiResult,
                  style: kBMITextStyle,),
                  Text(
                      interpretation,
                  textAlign: TextAlign.center,
                  style: kBMIBodyTextStyle,
                  ),
                ],
              ), onPresed: (){},
            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'Re-CALCULATE'),
        ],
      ),
    );
  }
}
