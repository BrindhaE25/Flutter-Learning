import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            image: AssetImage('assets/quiz-logo.png'),
            height : 300,
            width : 300,
            color: Color.fromARGB(150, 255, 255, 255),),
          const SizedBox(height: 80,),
          Text(
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.w100,
          ),
              "Learn Flutter the fun way!!"),
          const SizedBox(height: 50,),
          OutlinedButton.icon(
              onPressed: () => {
                startQuiz()
              },
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Start Quiz")),
        ],
      );
  }

}
