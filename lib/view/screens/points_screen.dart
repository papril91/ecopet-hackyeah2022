import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp2/constants.dart';
import '../../controller/index_controller.dart';
import 'home_screen.dart';

class PointsPage extends StatelessWidget {
  const PointsPage({super.key, required this.points});

  final int points;

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
          body: Container(
            height: (MediaQuery.of(context).size.height),
            decoration: BoxDecoration(
              gradient: pPrimaryGradient,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // SvgPicture.asset('assets/icons/bg_level.svg', fit: BoxFit.fill),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 50),
                                  SvgPicture.asset(
                                    'assets/icons/stars.svg',
                                    fit: BoxFit.fill,
                                    color: const Color(0xFFFF7801),
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/5points.svg',
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 40,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'YOU’VE REACHED \nNEW LEVEL!',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.dosis(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF66341C),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Choose your reward:',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dosis(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF66341C),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Container(
                                    width: (MediaQuery.of(context).size.width /
                                        1.10),
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF7801),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/orange.svg',
                                          fit: BoxFit.fill,
                                        ),
                                        const Text(
                                          textAlign: TextAlign.center,
                                          'ECO 5GBs',
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Container(
                                    width: (MediaQuery.of(context).size.width /
                                        1.10),
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF794023),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/trees.svg',
                                          fit: BoxFit.fill,
                                        ),
                                        const Text(
                                          textAlign: TextAlign.center,
                                          'PLANT A TREE',
                                          style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
