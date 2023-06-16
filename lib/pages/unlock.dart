import 'package:chat/components/rounded_icon_button.dart';
import 'package:chat/pages/home.dart';
import 'package:chat/pages/onboarding3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/main_text_button.dart';

class UnlockPage extends StatefulWidget {
  const UnlockPage({Key? key}) : super(key: key);

  @override
  UnlockPageState createState() => UnlockPageState();
}

class UnlockPageState extends State<UnlockPage> {
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
                    margin: const EdgeInsets.only(left: 15),
                    child: RoundedIconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Onboarding3Page()),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 47,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Do something when the button is pressed.
                      },
                      child: Text(
                        'Restore',
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "Unlock Unlimited Access",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                child: Card(
                  color: const Color(0xff262633),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 51, top: 37),
                        child: Row(
                          children: [
                            Image.asset('assets/images/answer_icon.png'),
                            const SizedBox(
                              width: 34,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Answers from GPT3.5',
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  'More accurate & detailed answers',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.white12,
                        indent: 43,
                        endIndent: 43,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 51),
                        child: Row(
                          children: [
                            Image.asset('assets/images/higher_icon.png'),
                            const SizedBox(
                              width: 34,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Higher word limit',
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  'Type longer messages',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.white12,
                        indent: 43,
                        endIndent: 43,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 51),
                        child: Row(
                          children: [
                            Image.asset('assets/images/no_limits_icon.png'),
                            const SizedBox(
                              width: 34,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No Limits',
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  'Have unlimited dialogues',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.white12,
                        indent: 43,
                        endIndent: 43,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 51, bottom: 35),
                        child: Row(
                          children: [
                            Image.asset('assets/images/no_ads_icon.png'),
                            const SizedBox(
                              width: 34,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No Ads',
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  'Enjoy Ask Al without any ads',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 202,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          transform: GradientRotation(-42.16 * 3.14 / 180),
                          colors: [
                            Color(0xFF191922),
                            Color.fromRGBO(100, 76, 143, 0.576131),
                            Color(0xFF3FAAA1)
                          ],
                          stops: [0.0, 0.4523, 1.1973],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:
                              const Color(0xff644C8F), // Set border color here
                          width: 1, // Set border width here
                        ),
                      ),
                      width: (MediaQuery.of(context).size.width - 48) / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 30,
                            margin: const EdgeInsets.only(right: 21, top: 5),
                            child: Material(
                              shape: const CircleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              color: const Color(0xff262633),
                              child: Checkbox(
                                checkColor: const Color(0xff191922),
                                activeColor: Colors.white,
                                value: true,
                                shape: const CircleBorder(),
                                side: BorderSide.none,
                                onChanged: (bool? value) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 27, left: 20),
                            child: Text(
                              "USD5.99 / \n Week",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 19, left: 20),
                            child: Text(
                              "3 days Free Trial, \n Auto Renewal",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 202,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white24,
                          width: 1, // Set border width here
                        ),
                      ),
                      width: (MediaQuery.of(context).size.width - 48) / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 92,
                                height: 29,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white24,
                                    width: 1, // Set border width here
                                  ),
                                ),
                                margin: const EdgeInsets.only(left: 21, top: 5),
                                child: Text(
                                  'Save 70%',
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          color: Color(0xff191922),
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                width: 30,
                                margin:
                                    const EdgeInsets.only(right: 21, top: 5),
                                child: Material(
                                  shape: const CircleBorder(
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  color: const Color(0xff262633),
                                  child: Checkbox(
                                    checkColor: const Color(0xff191922),
                                    activeColor: Colors.white,
                                    value: false,
                                    shape: const CircleBorder(),
                                    side: BorderSide.none,
                                    onChanged: (bool? value) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 27, left: 20),
                            child: Text(
                              "USD49.99 / \n Lifetime",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 19, left: 20),
                            child: Text(
                              "Billed Once",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18, left: 15, right: 15),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: MainTextButton(
                    text: "Start Free Trial",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
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
