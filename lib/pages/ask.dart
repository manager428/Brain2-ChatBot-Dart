import 'package:chat/components/message_container_widgets.dart';
import 'package:chat/models/chatgpt_message_model.dart';
import 'package:chat/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:share_plus/share_plus.dart';
import '../apis/chatgpt_api.dart';
import '../components/rounded_icon_button.dart';
import '../components/rounded_second_icon_button.dart';
import '../components/typing_indicator.dart';
import 'package:intl/intl.dart';

class AskPage extends StatefulWidget {
  final String topic;
  final String initialQuestion;
  const AskPage({Key? key, required this.topic, required this.initialQuestion})
      : super(key: key);

  @override
  AskPageState createState() => AskPageState();
}

class AskPageState extends State<AskPage> {
  final TextEditingController _textController = TextEditingController();
  final _textFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  GlobalKey previewContainer = GlobalKey();
  int originalSize = 800;
  bool _isTyping = false;
  List<ChatgptMessageModel> messages = [];
  void _getAnswer(String question) async {
    setState(() {
      _isTyping = true;
      messages.add(ChatgptMessageModel(text: question, flag: true));
    });
    _textController.clear();
    _textFocusNode.unfocus();
    GptService.getAnswer(question, widget.topic).then((value) {
      if (value != null) {
        String answer = value.trim();
        setState(() {
          messages.add(ChatgptMessageModel(text: answer, flag: false));
        });
        _isTyping = false;
        DateTime now = DateTime.now();
        String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
        GptService.addHistory(
            question, answer.trim().replaceFirst(RegExp(r'^\.\s*'), ''), date);
      }
    });
  }

  @override
  void initState() {
    String initialQuestion = widget.initialQuestion;
    if (initialQuestion != '') {
      _getAnswer(widget.initialQuestion);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void settingModalBottomSheet(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xff644C8F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(
                        Icons.text_fields,
                        color: Colors.white,
                        size: 40,
                      ),
                      title: Text(
                        'Share Questions and Answers',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        String message = '';
                        for (var e in messages) {
                          if (e.flag) {
                            message += 'Question: ${e.text}\n\n\n';
                          } else {
                            message += 'Answer: ${e.text}\n\n\n';
                          }
                        }
                        Share.share(message);
                      }),
                  ListTile(
                      leading: const Icon(
                        Icons.screenshot,
                        color: Colors.white,
                        size: 40,
                      ),
                      title: Text(
                        'Share Screenshot',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        ShareFilesAndScreenshotWidgets().shareScreenshot(
                          previewContainer,
                          originalSize,
                          "Title",
                          "screenshot.png",
                          "image/png",
                          text: "Look this screenshot.",
                        );
                      }),
                ],
              ),
            );
          });
    }

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
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
                      settingModalBottomSheet(context);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: RepaintBoundary(
                key: previewContainer,
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (messages[messages.length - 1 - index].flag) {
                      return QuestionWidget(
                          widgetText:
                              messages[messages.length - 1 - index].text);
                    } else {
                      bool flag = false;
                      if (index == 0) {
                        flag = true;
                      }
                      return AnswerWidget(
                        widgetText: messages[messages.length - 1 - index].text,
                        flag: flag,
                      );
                    }
                  },
                ),
              ),
            ),
            if (_isTyping) const TypingIndicator(),
            SizedBox(
              height: 79,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 35),
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10, top: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xff13131A),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: TextFormField(
                        controller: _textController,
                        focusNode: _textFocusNode,
                        cursorColor: Colors.white,
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
                        style: const TextStyle(color: Colors.white),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 17,
                    right: 22,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: RoundedSecondIconButton(
                        icon: const Icon(FontAwesomeIcons.paperPlane),
                        onPressed: () {
                          if (_textController.text != '') {
                            _getAnswer(_textController.text);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
