import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.calculate,@required this.result,@required this.line});

  final String calculate,result,line;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20,left: 30),
              alignment: Alignment.bottomLeft,
              child: Text(
                  'Your Result',
                style: TextStyle(
                  color: Color(0xFFD6D6D6),
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Kalam',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(colour: Color(0xFF1D1E33),
              card: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Kalam',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.teal[400],
                  ),
                  ),
                  Text(calculate,
                    style: TextStyle(
                      color: Color(0xFFD6D6D6),
                      fontSize: 100,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Kalam',
                    ),
                  ),
                  Text(line,
                  textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
