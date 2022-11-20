import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp2/constants.dart';

import '../../controller/index_controller.dart';

class OptionBox extends StatelessWidget {
  OptionBox({
    Key? key,
    // required this.selectedOption,
    required this.optionIndex,
    required this.indexForQuestionNumber,
    required this.providerIndexForOption,
    required this.optionParameter,
    required this.optionSelected,
  }) : super(key: key);

  final String optionIndex;
  final int indexForQuestionNumber;
  final List optionParameter;
  int optionSelected;

  final int providerIndexForOption;

  @override
  Widget build(BuildContext context) {
    return Consumer<IndexController>(builder: (context, provider, child) {
      Color changeColor() {
        print('provider.optionSelected: ${provider.optionSelected}');
        if (provider.optionSelected == 1 && providerIndexForOption == 1) {
          return const Color(0xFFFF7900);
        } else if (provider.optionSelected == 2 &&
            providerIndexForOption == 2) {
          return const Color(0xFFFF7900);
        } else if (provider.optionSelected == 3 &&
            providerIndexForOption == 3) {
          return const Color(0xFFFF7900);
        } else if (provider.optionSelected == 4 &&
            providerIndexForOption == 4) {
          return const Color(0xFFFF7900);
        }
        return Colors.transparent;
      }

      return Container(
        color: changeColor(),
        child: ListTile(
          onTap: () {
            provider.selectedOptionIndex(providerIndexForOption);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: changeColor(),
          leading: Text(
            optionIndex,
            style: GoogleFonts.dosis(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF66341C),
            ),
          ),
          title: Text(
            optionParameter[indexForQuestionNumber],
            textAlign: TextAlign.left,
            style: GoogleFonts.dosis(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: -0.3,
              color: const Color(0xFF66341C),
            ),
          ),
        ),
      );
    });
  }
}
