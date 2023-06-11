import 'package:chat/components/history_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/rounded_icon_button.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  List<String> messages = ["test!", "test", "test", "test"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff191922),
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
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Text(
                    'History',
                    style: GoogleFonts.lato(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 40,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return const HistoryMessageWidget(
                      widgetText:
                          'Certainly! Here\'s an interesting sentence to kick things off: "Science is the systematic and logical study of the natural world, based on ...');
                },
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
