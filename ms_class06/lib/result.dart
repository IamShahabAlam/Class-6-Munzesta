import 'package:flutter/material.dart';
import 'package:ms_class06/conatinerWid.dart';
import 'constants.dart';
import 'bottomButton.dart';
import 'calculator_brain.dart';

 
 class Result extends StatelessWidget {
     Result({this.bmiResult,this.resultText,this.suggestion});

  final String bmiResult ;
  final String resultText;
  final String suggestion;

  
   @override
   Widget build(BuildContext context) {
     return 
Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Center(child: Text("RESULTS"),),),

      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(child: Container( margin: EdgeInsets.only(left:30,top:25) ,child: Text("YOUR BMI",style: kresultTitle,))),
        Expanded(flex: 5, child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ContainerWid( 
            colour: Colors.grey[900] ,
            cardChild: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText,style: kResultTextColor ,),

                Text(bmiResult,style: kBMIStyle,),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(suggestion,style: kBMIsuggest, textAlign: TextAlign.center,),
                )
              ],
            ),
            ),
        ), 
          ),
          
      BottomButton(buttonTitle: "RE CALCULATE", onTap: (){Navigator.pop(context);},)
      ],),
   
    );
   }
 }


