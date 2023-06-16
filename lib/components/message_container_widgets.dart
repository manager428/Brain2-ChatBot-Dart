import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionWidget extends StatelessWidget {
  final String widgetText; // Declare a final variable to hold the text

  const QuestionWidget(
      {super.key,
      required this.widgetText}); // Constructor to accept the text parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xff191922),
        borderRadius: BorderRadius.circular(15),
        border:
            Border.all(color: const Color.fromARGB(255, 60, 41, 95), width: 1),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Material(
            shape: CircleBorder(),
            color: Color(0xff262633),
            child: Icon(
              Icons.star,
              color: Color(0xff262633),
              size: 40,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(widgetText,
                softWrap: true,
                style: GoogleFonts.lato(
                  textStyle:
                      const TextStyle(color: Colors.white70, fontSize: 16),
                )),
          ), // Use the widgetText parameter as the text
        ],
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  final String widgetText; // Declare a final variable to hold the text
  final bool flag;
  const AnswerWidget(
      {super.key,
      required this.widgetText,
      required this.flag}); // Constructor to accept the text parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF191922),
              Color.fromRGBO(100, 76, 143, 0.576131),
              Color(0xFF3FAAA1)
            ],
            stops: [0.0, 0.3399, 1.0009],
            transform: GradientRotation(134.27 * 3.1415926535 / 180)),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff644C8F), width: 1),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Material(
              shape: CircleBorder(),
              color: Color(0xff262633),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.chat,
                  color: Color(0xff644C8F),
                  size: 30,
                ),
              )),
          const SizedBox(width: 8),
          Expanded(
            child: flag
                ? AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        widgetText.trim().replaceFirst(RegExp(r'^\.\s*'), ''),
                        textStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  )
                : Text(
                    widgetText.trim().replaceFirst(RegExp(r'^\.\s*'), ''),
                    softWrap: true,
                    style: GoogleFonts.lato(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
