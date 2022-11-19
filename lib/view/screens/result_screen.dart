import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quizapp2/constants.dart';
import '../../../controller/index_controller.dart';
import 'start_screen.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key, required this.marksEarnedFromQuiz});

  int marksEarnedFromQuiz = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentTextStyle: GoogleFonts.dosis(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('Quit Quiz?'),
              content: const Text(
                'Are you sure you want exit!',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => exit(0)));
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Consumer<IndexController>(
          builder: (context, getIndexProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            fit: StackFit.expand,
            children: [
              SvgPicture.asset(
                'assets/icons/bg_duze.svg',
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/icons/happy-bear.svg'),
              ),
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 350,
                      width: (MediaQuery.of(context).size.width / 1.10),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: bPrimaryGradient,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           SizedBox(
              //             width: 149.33,
              //             height: 149.33,
              //             child: CircularPercentIndicator(
              //               backgroundColor:
              //                   const Color.fromRGBO(230, 230, 230, 1),
              //               animation: true,
              //               radius: 70,
              //               lineWidth: 13.0,
              //               percent: marksEarnedFromQuiz / 3,
              //               animationDuration: 1000,
              //               reverse: true,
              //               circularStrokeCap: CircularStrokeCap.round,
              //               center: Text(
              //                 "$marksEarnedFromQuiz/3",
              //                 style: GoogleFonts.dosis(
              //                   color: Colors.black,
              //                   fontWeight: FontWeight.w700,
              //                   letterSpacing: -0.3,
              //                   fontSize: 15,
              //                 ),
              //               ),
              //               progressColor: marksEarnedFromQuiz > 4
              //                   ? const Color.fromRGBO(82, 186, 0, 1)
              //                   : const Color.fromRGBO(254, 123, 30, 1),
              //             ),
              //           ),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               marksEarnedFromQuiz < 2
              //                   ? Container(
              //                       width: 150,
              //                       height: 40,
              //                       decoration: BoxDecoration(
              //                         color:
              //                             const Color.fromRGBO(254, 123, 30, 1),
              //                         borderRadius: BorderRadius.circular(20),
              //                       ),
              //                       child: Center(
              //                         child: Text(
              //                           'Ooops...!',
              //                           style: GoogleFonts.dosis(
              //                             color: const Color.fromRGBO(
              //                                 255, 255, 255, 1),
              //                             fontWeight: FontWeight.w800,
              //                             letterSpacing: -0.3,
              //                             fontSize: 15,
              //                           ),
              //                         ),
              //                       ),
              //                     )
              //                   : Container(
              //                       width: 380,
              //                       height: 40,
              //                       decoration: BoxDecoration(
              //                         color:
              //                             const Color.fromRGBO(82, 186, 0, 1),
              //                         borderRadius: BorderRadius.circular(20),
              //                       ),
              //                       child: Center(
              //                           child: Text(
              //                         'Super! W lesie juz wiedzą, ze jestesmy coraz lepsi!',
              //                         style: GoogleFonts.dosis(
              //                           color: const Color.fromRGBO(
              //                               255, 255, 255, 1),
              //                           fontWeight: FontWeight.w800,
              //                           letterSpacing: -0.3,
              //                           fontSize: 15,
              //                         ),
              //                       )),
              //                     ),
              //             ],
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               marksEarnedFromQuiz < 3
              //                   ? Padding(
              //                       padding: const EdgeInsets.only(
              //                         top: 23,
              //                       ),
              //                       child: Container(
              //                         width: 160,
              //                         height: 37,
              //                         color: Colors.white,
              //                         child: InkWell(
              //                           onTap: () {
              //                             Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                     builder: (context) =>
              //                                         const HomeScreen()));
              //                           },
              //                           child: Text(
              //                             'Ajj, jutro będzie lepiej',
              //                             textAlign: TextAlign.center,
              //                             style: GoogleFonts.dosis(
              //                               decoration:
              //                                   TextDecoration.underline,
              //                               color: const Color.fromRGBO(
              //                                   66, 130, 241, 1),
              //                               fontWeight: FontWeight.w700,
              //                               letterSpacing: -0.3,
              //                               fontSize: 15,
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     )
              //                   : Padding(
              //                       padding: const EdgeInsets.only(
              //                         top: 23,
              //                       ),
              //                       child: Container(
              //                         width: 160,
              //                         height: 60,
              //                         color: Colors.white,
              //                         child: Text(
              //                           'Congratulations\n You Passed the exam',
              //                           textAlign: TextAlign.center,
              //                           style: GoogleFonts.dosis(
              //                             color: Colors.black,
              //                             fontWeight: FontWeight.w700,
              //                             letterSpacing: -0.3,
              //                             fontSize: 15,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //             ],
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }
}
