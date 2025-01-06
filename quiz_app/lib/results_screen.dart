import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/results_summary.dart';

class ResultsScreen extends StatelessWidget{
   ResultsScreen({super.key, required this.chosenAnswers, required this.restartQuiz});

  List<String> chosenAnswers;
  void Function() restartQuiz;

  List<Map<String, Object>> populateSummary() {
    List<Map<String, Object>> summary = [];

    for(var i=0; i< chosenAnswers.length; i++) {
      summary.add({
        'question_index' : i,
        'question_text' : questions[i].text,
        'correct_answer' : questions[i].answer[0],
        'user_answer' : chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = populateSummary();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
   return SizedBox(
       width: double.infinity,
       child: Container(
       margin: const EdgeInsets.all(40),
       child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
                 "You have answered $correctQuestions out of $totalQuestions questions correctly!!",
               style: GoogleFonts.lato(
                 color: Colors.white,
                 fontWeight: FontWeight.w500
               ),
               textAlign: TextAlign.center,
             ),
            const SizedBox(height: 20,),
            ResultsSummary(summaryData),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: restartQuiz,
                  label: Text(
                    "Restart Quiz",
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
           ],
       ),
       ),
   );
  }

}
