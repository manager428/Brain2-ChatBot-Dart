import 'package:chat/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/main_text_button.dart';

class Onboarding3Page extends StatefulWidget {
  const Onboarding3Page({Key? key}) : super(key: key);

  @override
  Onboarding3PageState createState() => Onboarding3PageState();
}

class Onboarding3PageState extends State<Onboarding3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff191922),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 73, left: 34),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Get instant answers",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 45,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, left: 34, right: 31),
                child: Text(
                  "Type anything you'd like to ask or choose from ready-made questions!",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                  ),
                  Positioned(
                    right: 15,
                    top: 56,
                    child: Container(
                      width: 260,
                      height: 80,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xff13131A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(10),
                        ), // make the border radius here
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: const Text(
                        'Explain quantum computing in simple terms.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 35,
                    top: 24,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff644C8F),
                        borderRadius: BorderRadius.circular(
                            30), // make the border radius here
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: const Text(
                        '🧬   Science',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 110,
                  ),
                  Positioned(
                    right: 15,
                    top: 15,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 65,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF191922),
                            Color.fromRGBO(100, 76, 143, 0.576131),
                            Color(0xFF3FAAA1),
                          ],
                          stops: [0.0, 0.3399, 1.0009],
                          // angle value is not directly supported in Flutter,
                          // but you can get similar results using the `begin` and `end` properties.
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ), // make the border radius here
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 43),
                      margin: const EdgeInsets.symmetric(vertical: 17),
                      child: const Text(
                        'Write an academic essay on...',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff644C8F),
                        borderRadius: BorderRadius.circular(
                            30), // make the border radius here
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: const Text(
                        '📑   Essay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                  ),
                  Positioned(
                    right: 15,
                    top: 35,
                    child: Container(
                      width: 260,
                      height: 80,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xff13131A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(10),
                        ), // make the border radius here
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: const Text(
                        'How do you say "How are you" in Korean?',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 35,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff644C8F),
                        borderRadius: BorderRadius.circular(
                            30), // make the border radius here
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: const Text(
                        '📖   Translate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 100, left: 15, right: 15),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: MainTextButton(
                    text: "Next",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    }),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
