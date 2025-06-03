import 'package:flutter/material.dart';
import 'package:seven_course_app/main.dart';

import 'constant.dart';

class ResultScreen extends StatefulWidget {
  final int bmiResult;
  const ResultScreen({super.key, required this.bmiResult});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var bmiColor = Colors.white;
  var bmiText = 'Normal';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  void updateUI() {
    var bmi = widget.bmiResult;
    if (bmi < 18) {
      setState(() {
        bmiColor = Colors.lightBlueAccent;
        bmiText = 'Underweight';
      });
    } else if (bmi >= 18 && bmi <= 25) {
      setState(() {
        bmiColor = Colors.green;
        bmiText = 'Normal';
      });
    } else if (bmi >= 26 && bmi <= 30) {
      setState(() {
        bmiColor = Colors.yellow;
        bmiText = 'Overweight';
      });
    } else if (bmi >= 31 && bmi <= 35) {
      setState(() {
        bmiColor = Colors.orange;
        bmiText = 'Obese';
      });
    } else if (bmi >= 36) {
      setState(() {
        bmiColor = Colors.red;
        bmiText = 'Extreme';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlueColour,
        title: Text(
          'Result Screen',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      backgroundColor: darkBlueColour,
      body: Column(
        children: [
          Container(
            height: height * 0.2,
            width: width,
            decoration: BoxDecoration(
                color: blueColor, borderRadius: BorderRadius.circular(5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Your BMI Value is',
                  style: textStyle,
                ),
                Text(
                  '${widget.bmiResult}',
                  style: fontStyle,
                ),
                Text('${bmiText}', style: textStyle.copyWith(color: bmiColor)),
              ],
            ),
          ),
          Image.asset(
            'assets/images/${bmiText}.png',
            height: height * 0.6,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Calculate Again',
                  style: textStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
