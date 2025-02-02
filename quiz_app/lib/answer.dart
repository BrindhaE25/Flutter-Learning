import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Answer(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
       onPressed: onTap,
       style: ElevatedButton.styleFrom(
         backgroundColor: const Color.fromARGB(255, 33, 1, 95),
         foregroundColor: Colors.white,
         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(40),
         )
       ),
       child: Text(
         answerText,
         textAlign: TextAlign.center,
       ));
  }

}
