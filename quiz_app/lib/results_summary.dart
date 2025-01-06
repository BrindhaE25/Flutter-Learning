import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsSummary extends StatelessWidget {
  const ResultsSummary(this.summary,{super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 400,
     child:  SingleChildScrollView(
        child: Column(
      children: summary.map((data){
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: data['user_answer'] == data['correct_answer']
                    ? const Color.fromARGB(255, 117, 185, 239)
                    : const Color.fromARGB(255, 217, 91, 145),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: Text(
                ((data['question_index'] as int) + 1).toString(),
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      data['question_text'] as String,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                      data['correct_answer'] as String,
                    style: GoogleFonts.lato(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                      data['user_answer'] as String,
                    style: GoogleFonts.lato(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.start,
                  ),
              ],
            ),
            ),
          ],
        );
        }).toList(),
    ),
    ),
    );
  }

}
