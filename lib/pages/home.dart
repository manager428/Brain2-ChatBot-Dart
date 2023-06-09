import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/main_text_button.dart';
import '../components/rounded_icon_button.dart';
import '../components/rounded_second_icon_button.dart';
import '../components/second_text_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
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
              const SizedBox(
                height: 73,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Text(
                      'Ask AI',
                      style: GoogleFonts.lato(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: RoundedIconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        // do something when button is pressed
                      },
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Text(
                  'My History',
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'There is no conversation yet ',
                        hintStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Color(0xff535353), fontSize: 22),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white24, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff644C8F), width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      controller: _textController,
                      maxLines: 6,
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    right: 23,
                    child: SizedBox(
                      height: 60,
                      width: 160,
                      child: MainTextButton(text: "Start", onPressed: () {}),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  'Suggestions',
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 60,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
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
                                borderRadius: BorderRadius.circular(
                                    30), // make the border radius here
                                border: Border.all(
                                    color: const Color(0xff644C8F), width: 1)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: const Text(
                              '📖   Education',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff191922),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color(0xff644C8F), width: 1),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: const Text(
                              '🕺   Fun',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff191922),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color(0xff644C8F), width: 1),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: const Text(
                              '📆   Daily Lifestyl',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // Add more widgets here as needed.
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: SecondTextButton(text: "Science Chat", onPressed: () {}),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child:
                    SecondTextButton(text: "English Teacher", onPressed: () {}),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: SecondTextButton(text: "Translator", onPressed: () {}),
              ),
              Stack(
                children: [
                  Container(
                    height: 76,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color(
                          0xff13131A), // Set the background color of text field.
                      borderRadius: BorderRadius.circular(
                          35), // Optionally, you can set the border radius.
                    ),
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Write your message',
                        hintStyle: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Color(0xff535353), fontSize: 16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff13131A), width: 1),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff13131A), width: 1),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                      maxLines: null,
                    ),
                  ),
                  Positioned(
                    bottom: 33,
                    right: 22,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: RoundedSecondIconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // do something when button is pressed
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
