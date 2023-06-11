import 'package:chat/components/message_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/rounded_icon_button.dart';
import '../components/rounded_second_icon_button.dart';

class AskPage extends StatefulWidget {
  const AskPage({Key? key}) : super(key: key);

  @override
  AskPageState createState() => AskPageState();
}

class AskPageState extends State<AskPage> {
  final TextEditingController _textController = TextEditingController();
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
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      // do something when button is pressed
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Text(
                    'Ask',
                    style: GoogleFonts.lato(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: RoundedIconButton(
                    icon: const Icon(
                      FontAwesomeIcons.arrowUpFromBracket,
                      size: 20,
                    ),
                    onPressed: () {
                      // do something when button is pressed
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index % 2 == 0) {
                    return const QuestionWidget(
                        widgetText:
                            'Act like a Professor. You will give me new information. You will present interesting information from basic sciences. You can start by saying an interesting sentence about science.');
                  } else {
                    return const AnswerWidget(
                        widgetText:
                            'Certainly! Here\'s an interesting sentence to kick things off: "Science is the systematic and logical study of the natural world, based on observation, experimentation, and evidence."Now, let me share some fascinating information from the field of biology. Did you know that the largest organism on Earth is not a blue whale or an elephant, but a giant fungus? The fungus, known as Armillaria');
                  }
                },
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 76,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                      icon: const Icon(FontAwesomeIcons.paperPlane),
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
