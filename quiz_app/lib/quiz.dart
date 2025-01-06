import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'my_home_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> answers = [];

  void switchScreen() {
    setState(() {
      activeScreen =  QuestionScreen(onSelectAnswer : addAnswers);
    });
  }

  void restartQuiz() {
    answers = [];
    setState(() {
      activeScreen =  MyHomePage(switchScreen);
    });
  }

  void addAnswers(String answer) {
    answers.add(answer);

    if(answers.length == questions.length) {
      setState(() {
        activeScreen =  ResultsScreen(chosenAnswers : answers, restartQuiz: restartQuiz,);
      });
    }
  }

  @override
  void initState() {
    activeScreen = MyHomePage(switchScreen);
    super.initState();
  }

  @override
  Widget build(context) {
   return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 800,
          width: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
