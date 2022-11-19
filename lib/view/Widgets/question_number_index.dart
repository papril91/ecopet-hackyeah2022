import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp2/constants.dart';

class QuestionNumberIndex extends StatelessWidget {
  int questionNumber;

  QuestionNumberIndex({Key? key, required this.questionNumber})
      : super(key: key);
  // int questionNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: kPrimaryGradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: 168,
        height: 30,
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            'QUESTION $questionNumber OF 3',
            style: GoogleFonts.dosis(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: -0.3,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
