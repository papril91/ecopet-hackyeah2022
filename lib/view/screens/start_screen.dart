import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp2/constants.dart';
import '../../controller/index_controller.dart';
import 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      child: Consumer<IndexController>(builder: (context, provider, child) {
        return Scaffold(
          body: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                SvgPicture.asset('assets/icons/main_bg_all.svg',
                    fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/level-progress.svg',
                                  fit: BoxFit.fill),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 110,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width / 1.10),
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  gradient: bPrimaryGradient,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/help-circle.svg',
                                            fit: BoxFit.fill),
                                        const SizedBox(width: 15),
                                        const Text(
                                          'DO YOU KNOW...',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF66341C),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Between ',
                                        style: GoogleFonts.dosis(
                                          color: const Color(0xFF66341C),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.0,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '83,000',
                                            style: GoogleFonts.dosis(
                                              color: const Color(0xFFFF7900),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.0,
                                            ),
                                          ),
                                          const TextSpan(text: ' and'),
                                          TextSpan(
                                            text: ' 145,000',
                                            style: GoogleFonts.dosis(
                                              color: const Color(0xFFFF7900),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.0,
                                            ),
                                          ),
                                          const TextSpan(
                                              text:
                                                  ' cubic meters of garbage are dumped in Polish forests every year'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset('assets/icons/sad_bear.svg'),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              provider.restartIndexForQuestion();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FirstPage()));
                            },
                            child: Container(
                              width: (MediaQuery.of(context).size.width / 1.10),
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                textAlign: TextAlign.center,
                                'HELP THE BEAR',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
