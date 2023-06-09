import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/main_text_button.dart';
import 'onboarding3.dart';

class Onboarding2Page extends StatefulWidget {
  const Onboarding2Page({Key? key}) : super(key: key);

  @override
  Onboarding2PageState createState() => Onboarding2PageState();
}

class Onboarding2PageState extends State<Onboarding2Page> {
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
                  "Chat with \n Ask Al",
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
                  "Ask anything or have a conversation! Ask Al will keep your dialogue in memory.",
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
                        '1 like Italian kitchen, what should I cook for dinner?',
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
                        '🌮  Recipe',
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
                width: MediaQuery.of(context).size.width,
                height: 100,
                alignment: Alignment.center,
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
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ), // make the border radius here
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 43),
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: const Text(
                  'If you\'re looking for an Italian-inspired dinner, you can\'t go wrong with Spaghetti Bolognese.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                margin: const EdgeInsets.only(right: 15, top: 17, left: 100),
                child: const Text(
                  'Great! Now, give me the recipe',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                alignment: Alignment.center,
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
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ), // make the border radius here
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 43),
                margin:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                child: const Text(
                  'Sure! Here\'s a simple recipe for Spaghetti Bolognese Ingredients:• 1 pound spaghetti, 1 pound ground...',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45, left: 15, right: 15),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: MainTextButton(
                    text: "Next",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Onboarding3Page()),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
