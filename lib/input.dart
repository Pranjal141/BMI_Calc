import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_widget.dart';
import 'round_button.dart';
import 'result_page.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculator.dart';

enum Gender{male,female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180, weight=75, age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? onTapColor : inactiveColor, //Ternary Operator
                    card: IconWidget(text: 'MALE' , i: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? onTapColor : inactiveColor, //Ternary Operator
                    card: IconWidget(text: 'FEMALE' , i: FontAwesomeIcons.venus),
                ),
                )
              ],
            )),
            Expanded(child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ReuseableCard(
                            card: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('HEIGHT',
                              style: textStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      height.toString(),
                                      style: numberStyle,
                                    ),
                                    Text(
                                      ' cm',
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.red[200],
                                    inactiveTrackColor: Colors.grey[400],
                                    thumbColor: Colors.red[600],
                                    overlayColor: Color(0x20E44336),
                                    thumbShape:
                                    RoundSliderThumbShape(enabledThumbRadius: 11),
                                    overlayShape:
                                      RoundSliderOverlayShape(overlayRadius: 26)
                                  ),
                                  child: Slider(
                                    value: height.toDouble(),
                                    min: 120,
                                    max: 220,
                                    onChanged: (double newValue){
                                      setState(() {
                                        height=newValue.toInt();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            colour: Color(0xFF1D1E33),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            Expanded(child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(colour: Color(0xFF1D1E33),
                    card: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                        style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              longPress: (){
                                setState(() {
                                  weight-=10;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              longPress: (){
                                setState(() {
                                  weight+=10;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(colour: Color(0xFF1D1E33),
                    card: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              longPress: (){
                                setState(() {
                                  age-=10;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              longPress: (){
                                setState(() {
                                  age+=10;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          BottomButton(
            text: 'CALCULATE',
            onTap: (){
              Calculator calc= Calculator(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              calculate: calc.calculate(),
              result: calc.getResult(),
              line: calc.getLine(),
            ),
            ),
            );
          },),
          ],
        ),
      ),
    );
  }
}











