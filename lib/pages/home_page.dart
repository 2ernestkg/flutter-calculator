import 'package:calculator/components/calc_button.dart';
import 'package:calculator/models/button_record.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userQuestion = '';
  String userAnswer = '';

  void clearExpression() {
    setState(() {
      userQuestion = '';
    });
  }

  List<ButtonRecord> buttons = [
    ButtonRecord(
      text: 'C',
      textColor: Colors.white,
      color: Colors.green,
    ),
    ButtonRecord(
      text: 'DEL',
      textColor: Colors.white,
      color: Colors.red,
    ),
    ButtonRecord(
      text: '%',
      textColor: Colors.white,
      color: Colors.deepPurple,
    ),
    ButtonRecord(
      text: '/',
      textColor: Colors.white,
      color: Colors.deepPurple,
    ),
    ButtonRecord(
      text: '9',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '8',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '7',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '*',
      textColor: Colors.white,
      color: Colors.deepPurple,
    ),
    ButtonRecord(
      text: '6',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '5',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '4',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '-',
      textColor: Colors.white,
      color: Colors.deepPurple,
    ),
    ButtonRecord(
      text: '3',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '2',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '1',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '+',
      textColor: Colors.white,
      color: Colors.deepPurple,
    ),
    ButtonRecord(
      text: '0',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '.',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: 'ANS',
      textColor: Colors.deepPurple,
      color: Colors.deepPurple.shade50,
    ),
    ButtonRecord(
      text: '=',
      textColor: Colors.white,
      color: Colors.deepPurple,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return CalcButton(
                        text: buttons[index].text,
                        textColor: buttons[index].textColor,
                        color: buttons[index].color,
                        buttonTap: () {
                          setState(() {
                            userQuestion = '';
                            userAnswer = '';
                          });
                        });
                  } else if (index == 1) {
                    return CalcButton(
                      text: buttons[index].text,
                      textColor: buttons[index].textColor,
                      color: buttons[index].color,
                      buttonTap: () {
                        setState(() {
                          if (userQuestion.isEmpty) {
                            return;
                          }
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                    );
                  } else if (index == buttons.length - 2) {
                    return CalcButton(
                      text: buttons[index].text,
                      textColor: buttons[index].textColor,
                      color: buttons[index].color,
                      buttonTap: () {
                        setState(() {
                          if (userAnswer.isEmpty) {
                            return;
                          }
                          userQuestion = userAnswer;
                          userAnswer = '';
                        });
                      },
                    );
                  } else if (index == buttons.length - 1) {
                    return CalcButton(
                        text: buttons[index].text,
                        textColor: buttons[index].textColor,
                        color: buttons[index].color,
                        buttonTap: () {
                          setState(() {
                            String finalQuestion = userQuestion;
                            finalQuestion = finalQuestion.replaceAll('x', '*');
                            Parser parser = Parser();
                            Expression exp = parser.parse(finalQuestion);

                            ContextModel cm = ContextModel();
                            double answer =
                                exp.evaluate(EvaluationType.REAL, cm);
                            userAnswer = answer.toString();
                            userQuestion = '';
                          });
                        });
                  } else {
                    return CalcButton(
                      text: buttons[index].text,
                      textColor: buttons[index].textColor,
                      color: buttons[index].color,
                      buttonTap: () {
                        setState(() {
                          userQuestion += buttons[index].text;
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
