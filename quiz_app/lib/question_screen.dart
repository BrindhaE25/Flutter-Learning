import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key, required this.onSelectAnswer});

  void Function(String value) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion question = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 201, 153, 251),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),

          ),
          const SizedBox(height: 20,),
          ...question.shuffleAnswers().map((answer) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Answer(answer, () {
                  answerQuestion(answer);
                }),
              ],
            );
          })
        ],
      ),
      ),
    );
  }

}
