import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{

  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
  
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];

  String activeScreen = "start-screen";

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void switchScreen(bool isRestart){
    setState(() {
      activeScreen = "question-screen";
      if(isRestart){
        selectedAnswers = [];
        activeScreen = "start-screen";
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget widgetScreen = StartScreen(switchScreen);

    if(activeScreen == "question-screen"){
      widgetScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }

    if(activeScreen == "results-screen"){
      widgetScreen = ResultsScreen(selectedAnswers,onRestart: switchScreen,);
    }



    return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 64, 10, 125),Color.fromARGB(255, 103, 12, 136)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: widgetScreen,
      ),
    ),
  );
  }

}
