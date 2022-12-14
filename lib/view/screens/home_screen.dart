import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp2/constants.dart';
import '../../controller/index_controller.dart';
import '../../utilities/list_of_answers.dart';
import '../../utilities/list_of_questions.dart';
import '../Widgets/option_box.dart';
import '../Widgets/question_box.dart';
import '../Widgets/question_number_index.dart';
import 'result_screen.dart';

class FirstPage extends StatelessWidget {
  int indexForQuestionNumber = 1;
  int selectedOption = 0;
  int marksObtainedFromCorrectAnswer = 0;

  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBD6),
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: const Color(0xFFFFFBD6),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset('assets/icons/bg_duze.svg', fit: BoxFit.fill),
          SafeArea(
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/level-progress.svg',
                    fit: BoxFit.fill),
                SvgPicture.asset('assets/icons/sad_bear.svg'),
                // const SizedBox(height: 20),
                Positioned(
                  top: 10,
                  child: Container(
                    height: 370,
                    width: (MediaQuery.of(context).size.width / 1.10),
                    decoration: BoxDecoration(
                      gradient: bPrimaryGradient,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 24,
                        right: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<IndexController>(
                            builder: (context, provider, child) {
                              indexForQuestionNumber =
                                  provider.currentQuestionIndex;
                              selectedOption = provider.optionSelected;
                              return QuestionNumberIndex(
                                questionNumber: indexForQuestionNumber,
                              );
                            },
                          ),
                          Consumer<IndexController>(
                            builder: (context, provider, child) {
                              indexForQuestionNumber =
                                  provider.currentQuestionIndex;
                              return QuestionBox(
                                  question:
                                      questionsList[indexForQuestionNumber]);
                            },
                          ),
                          Consumer<IndexController>(
                            builder: (context, provider, child) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  OptionBox(
                                    optionSelected: provider.optionSelected,
                                    optionParameter: optionOne,
                                    optionIndex: 'A.',
                                    indexForQuestionNumber:
                                        provider.currentQuestionIndex,
                                    providerIndexForOption: 1,
                                  ),
                                  OptionBox(
                                    optionSelected: provider.optionSelected,
                                    optionParameter: optionTwo,
                                    optionIndex: 'B.',
                                    indexForQuestionNumber:
                                        provider.currentQuestionIndex,
                                    providerIndexForOption: 2,
                                  ),
                                  OptionBox(
                                    optionSelected: provider.optionSelected,
                                    optionParameter: optionThree,
                                    optionIndex: 'C.',
                                    indexForQuestionNumber:
                                        provider.currentQuestionIndex,
                                    providerIndexForOption: 3,
                                  ),
                                  Consumer<IndexController>(
                                      builder: (context, provider, child) {
                                    indexForQuestionNumber =
                                        provider.currentQuestionIndex;
                                    selectedOption = provider.optionSelected;

                                    return selectedOption > 0
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Container(
                                                      height: 45,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              offset:
                                                                  Offset(1, 5),
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.25),
                                                              blurRadius: 1.5,
                                                              spreadRadius: 1,
                                                            ),
                                                            BoxShadow(
                                                                offset: Offset(
                                                                    1, 2),
                                                                color: Colors
                                                                    .white,
                                                                blurRadius: 1,
                                                                spreadRadius: 1)
                                                          ]),
                                                      child: ListTile(
                                                        onTap: () {
                                                          marksForCorrectAnswers();
                                                          // Przenies jesli jest wiecej niz dwie odpowiedzi
                                                          if (indexForQuestionNumber <
                                                              3) {
                                                            provider
                                                                .updateIndexForQuestion();
                                                          } else {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ResultPage(
                                                                  marksEarnedFromQuiz:
                                                                      marksObtainedFromCorrectAnswer,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          provider
                                                              .selectedOptionIndex(
                                                                  0);
                                                        },
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        tileColor: Colors.white,
                                                        leading: Text(
                                                          'NEXT',
                                                          style:
                                                              GoogleFonts.dosis(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                66,
                                                                130,
                                                                241,
                                                                1),
                                                          ),
                                                        ),
                                                        title: const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            right: 20,
                                                            bottom: 5,
                                                          ),
                                                          child: Icon(
                                                            Icons.arrow_forward,
                                                            color:
                                                                Color.fromRGBO(
                                                                    66,
                                                                    130,
                                                                    241,
                                                                    1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : const SizedBox(
                                            height: 65,
                                          );
                                  })
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void marksForCorrectAnswers() {
    if (indexForQuestionNumber == 1) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 2) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 3) {
      if (selectedOption == 2) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 4) {
      if (selectedOption == 2) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 5) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 6) {
      if (selectedOption == 4) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 7) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 8) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 9) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 10) {
      if (selectedOption == 4) {
        marksObtainedFromCorrectAnswer++;
      }
    }
  }
}
