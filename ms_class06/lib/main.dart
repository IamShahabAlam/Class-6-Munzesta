

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ms_class06/result.dart';
import 'conatinerWid.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottomButton.dart';
import 'calculator_brain.dart';

// BottomContainerHeight

enum Gender {
  male,
  female,
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

// ====================================================

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 5;
  int weight = 50;
  int age = 20;

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     // male
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     // Female
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Shahab's BMI App", style: TextStyle(color: Color(0xff820308) ,fontSize: 25,fontWeight:FontWeight.bold),)),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ContainerWid(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                    print("Male btn is pressed");
                  });
                },
                colour: selectedGender == Gender.male
                    ? kactiveCardColor
                    : kinactiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: "MALE",
                ),
              )),
              Expanded(
                  flex: 1,
                  child: ContainerWid(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                        print("Female btn is pressed");
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  )),
            ],
          )),
          Expanded(
            child: ContainerWid(
              colour: kinactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        "ft",
                        style: klabelTextStyle,
                      ),
                    ],
                  ),

                  SliderTheme( data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    // overlayColor: Colors.white10,
                    thumbColor: Colors.red,
                    activeTrackColor: Colors.red
                  ),
                    child: Slider(value: height.toDouble(), 
                    min: 3 ,
                    max: 7,
                    activeColor: Colors.red ,
                    inactiveColor: Colors.red[900] ,
                    onChanged: (double newValue){
                      setState(() {
                            height = newValue.round();
                                          });
                        print(newValue);
                    },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ContainerWid(
                        colour: kinactiveCardColor,
                        cardChild: Column( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT",style: klabelTextStyle,),
                            Text(weight.toString(), style: kNumberTextStyle,),
                            
                            Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(icon: FontAwesomeIcons.minus, onpress: (){
                                  setState(() {
                                    weight--;
                                    });
                                }, ),
                            
                            SizedBox(width: 20,),
                                
                                RoundIconButton(icon: FontAwesomeIcons.plus,onpress: (){
                                  setState(() {
                                      weight++;
                                                                    });
                                },),
                                ],
                            )

                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ContainerWid(
                        colour: kinactiveCardColor,
                        cardChild: Column( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("AGE",style: klabelTextStyle,),
                            Text(age.toString(), style: kNumberTextStyle,),
                            
                            Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(icon: FontAwesomeIcons.minus,onpress: (){
                                  setState(() {
                                    age--;
                                  });
                                },),
                                
                                SizedBox(width: 20,),
                                
                                RoundIconButton(icon: FontAwesomeIcons.plus,onpress: (){
                                  setState(() {
                                      age++;
                                   });
                                }),
                              ],
                            )

                          ],
                        ),
                      )),
                ],
              )),

          BottomButton(onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => 
            Result(
                bmiResult: calc.calculateBMI() ,
                resultText: calc.getResult() ,
                suggestion: calc.getSuggest() ,
            )));},
          buttonTitle: "CALCULATE BMI",)
        ],
      ),
    );
  }
}



// =========================================

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onpress});

  final IconData icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor( width:56, height: 56 ),
      shape: CircleBorder(),
      fillColor:  Color(0x80820303) , 
      onPressed: onpress,
      child: Icon(icon,color: Colors.red,) ,
    );
  }
}