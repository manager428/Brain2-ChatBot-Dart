import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryMessageWidget extends StatelessWidget {
  final String widgetText; // Declare a final variable to hold the text

  const HistoryMessageWidget(
      {super.key,
      required this.widgetText}); // Constructor to accept the text parameter

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xff191922),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: const Color.fromARGB(255, 60, 41, 95), width: 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 190,
                  child: Text(
                    "Interesting Science Facts from a Professor",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 25,
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              margin: const EdgeInsets.only(top: 17),
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
                  borderRadius:
                      BorderRadius.circular(30), // make the border radius here
                  border: Border.all(color: const Color(0xff644C8F), width: 1)),
              child: Text(
                "Certainly! Here's an interesting sentence to kick things off: \"Science is the systematic and logical study of the natural world, based on ...",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
