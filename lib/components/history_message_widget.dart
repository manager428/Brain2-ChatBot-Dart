import 'package:chat/apis/chatgpt_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';

class HistoryMessageWidget extends StatelessWidget {
  final String question; // Declare a final variable to hold the text
  final String answer;
  final String id;
  const HistoryMessageWidget(
      {super.key,
      required this.question,
      required this.answer,
      required this.id}); // Constructor to accept the text parameter

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
                    question,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 25,
                  ),
                  color: Colors.black,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: id,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            'Delete',
                            style: GoogleFonts.lato(
                                textStyle:
                                    const TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (String id) {
                    GptService.deleteHisotry(id).then((value) {
                      Toast.show(
                        'Successfully removed...',
                        duration: 3,
                        gravity: Toast.bottom,
                        backgroundColor: Colors.green,
                      );
                    });
                  },
                ),
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
                answer,
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
