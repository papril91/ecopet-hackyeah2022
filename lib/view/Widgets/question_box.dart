import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBox extends StatelessWidget {
  String question;
  QuestionBox({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Text(
        question,
        textAlign: TextAlign.left,
        style: GoogleFonts.dosis(
          color: const Color(0xFF66341C),
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.0,
        ),
      ),
    );
  }
}
