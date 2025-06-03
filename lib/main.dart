import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seven_course_app/constant.dart';
import 'package:seven_course_app/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int heightSlider = 120;
  int age = 25;
  int weight = 45;
  Color maleColour = Color(0xff033e66);
  Color femaleColour = Color(0xff033e66);

  int calculateBMI() {
    var heightInMetter = heightSlider / 100;
    var BMI = weight / (heightInMetter * heightInMetter);
    return BMI.round();
  }

  void selecterdGender(bool gender) {
    if (gender) {
      setState(() {
        maleColour = blueColor;
        femaleColour = selectedColour;
      });
    } else {
      setState(() {
        femaleColour = blueColor;
        maleColour = selectedColour;
      });
    }
  }

  addSubAge(bool ageadd) {
    if (ageadd) {
      setState(() {
        age++;
      });
    } else {
      setState(() {
        age--;
      });
    }
  }

  addSubWeight(bool weightadd) {
    if (weightadd) {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        weight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlueColour,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      backgroundColor: darkBlueColour,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selecterdGender(true);
                        });
                      },
                      child: ReusableCard(
                        colour: maleColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.mars,
                              color: Colors.white,
                              size: 80,
                            ),
                            Text('Male', style: textStyle)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selecterdGender(false);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.venus,
                              color: Colors.white,
                              size: 80,
                            ),
                            Text('Female', style: textStyle)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: blueColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: textStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${heightSlider}',
                        style: fontStyle,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'cm',
                        style: textStyle,
                      )
                    ],
                  ),
                  Slider(
                      min: 120,
                      max: 200,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white70,
                      thumbColor: Colors.pink,
                      value: heightSlider.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          heightSlider = value.toInt();
                        });
                      })
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: blueColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: textStyle,
                          ),
                          Text(
                            '${age}',
                            style: fontStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      addSubAge(true);
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      addSubAge(false);
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    colour: blueColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: textStyle,
                        ),
                        Text(
                          '${weight}',
                          style: fontStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    addSubWeight(true);
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    addSubWeight(false);
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              bmiResult: calculateBMI(),
                            )));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Calculate BMI',
                    style: textStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.icon, required this.onpressed});

  final IconData icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 6.0,
      constraints: BoxConstraints(minHeight: 56.0, minWidth: 56.0),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({super.key, required this.colour, required this.cardChild});

  Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
    );
  }
}
