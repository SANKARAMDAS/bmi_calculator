import 'package:bmi_calculator/buttom_button.dart';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/card_contain.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/icon_card.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGender;
  int Height = 180;
  int Weight = 60;
  int Age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPresed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kChildColor
                        : kInactivechildColor,
                    cardChild: IconContents(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kChildColor
                        : kInactivechildColor,
                    cardChild: IconContents(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    onPresed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kChildColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(Height.toString(),
                      style: kNumberTextStyle),
                      Text('cm',
                      style: kLabelTextStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor:  Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8DBE98),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x15EB1555),
                      // thumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 15.0),
                      //  overlayShape: RoundRangeSliderThumbShape(overlayRadius: 30.0),
                    ),
                    child: Slider(value: Height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            Height = newValue.round();
                          });
                        },
                    ),
                  ),
                ],
              ),
              onPresed: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPresed: () {},
                    colour: kChildColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                        style: kLabelTextStyle,),
                        Text(Weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
 onTap: (){
                                setState(() {
                                  Weight --;
                                });
 },
                            ),
                            SizedBox(width: 10.0,),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: (){
                                setState(() {
                                  Weight ++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPresed: () {},
                    colour: kChildColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                          style: kLabelTextStyle,),
                        Text(Age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: (){
                                setState(() {
                                  Age --;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: (){
                                setState(() {
                                  Age ++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: (){
            CalculatorBrain calc = CalculatorBrain(Weight: Weight, Height: Height);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ),),);
          },),
        ],
      ),
    );
  }
}





