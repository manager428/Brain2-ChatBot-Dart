import 'package:chat/apis/chatgpt_api.dart';
import 'package:chat/components/subject_widget.dart';
import 'package:chat/components/suggestions_widget.dart';
import 'package:chat/models/subject_widget_model.dart';
import 'package:chat/pages/ask.dart';
import 'package:chat/pages/history.dart';
import 'package:chat/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/main_text_button.dart';
import '../components/rounded_icon_button.dart';
import '../components/rounded_second_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textSecondController = TextEditingController();
  bool loading = false;
  List<String> suggestions = [
    // '📖   Education',
    // '🕺   Fun',
    // '📆   Daily Lifestyle'
  ];
  List<List<SubjectWidgetModel>> subjectsAll = [];
  List<SubjectWidgetModel> subjects = [];
  // List<SubjectWidgetModel> testSubjects = [
  //   const SubjectWidgetModel(
  //       title: 'Science Chat',
  //       topic: 'Science',
  //       initialQuestion:
  //           'Act like a Professor. You will give me new information. You will present interesting information from basic sciences. You can start by saying an interesting sentence about science.'),
  //   const SubjectWidgetModel(
  //       title: 'English Teacher',
  //       topic: 'English Teaching',
  //       initialQuestion:
  //           'Act like a Professor. You will give me new information. You will present interesting information from basic English learning. You can start by saying an interesting sentence about English learning'),
  //   const SubjectWidgetModel(
  //       title: 'Translator',
  //       topic: 'Translator',
  //       initialQuestion:
  //           'Act like a senior Translator. Translate this to French. Stay hungry, Stay foolish')
  // ];
  // List<SubjectWidgetModel> testSubjects1 = [
  //   const SubjectWidgetModel(
  //       title: 'Sports',
  //       topic: 'Sports',
  //       initialQuestion:
  //           'Act like a sports narrator. Please tell me about sports match in detail.'),
  // ];
  int i = 0;
  @override
  void initState() {
    _getSuggestions();
    super.initState();
  }

  void _getSuggestions() {
    setState(() {
      loading = true;
    });
    GptService.getSuggestions().then((querySnapshot) {
      List<String> tempSuggestions = [];
      List<List<SubjectWidgetModel>> tempSubjectsAll = [];
      for (var doc in querySnapshot.docs) {
        var suggesion = doc.data();

        tempSuggestions.add(suggesion['suggestion']);
        List<SubjectWidgetModel> tempSubjects = [];
        if (suggesion['subjects'] != null) {
          for (var sub in suggesion['subjects']) {
            SubjectWidgetModel tempSubject = SubjectWidgetModel(
                title: sub['title'],
                topic: sub['topic'],
                initialQuestion: sub['initialQuestion']);
            tempSubjects.add(tempSubject);
          }
        }
        tempSubjectsAll.add(tempSubjects);
      }

      setState(() {
        loading = false;
        suggestions = tempSuggestions;
        subjectsAll = tempSubjectsAll;
        if (tempSubjectsAll.isNotEmpty) {
          subjects = tempSubjectsAll[0];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CircularProgressIndicator(color: Colors.white),
        child: Container(
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
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 28),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: RoundedIconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: TextButton(
                    child: Text(
                      'My History',
                      style: GoogleFonts.lato(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryPage()),
                      );
                    },
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextFormField(
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: Colors.white)),
                        decoration: InputDecoration(
                          hintText: 'There is no conversation yet ',
                          hintStyle: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Color(0xff535353), fontSize: 22),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white24, width: 1),
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
                        child: MainTextButton(
                            text: "Start",
                            onPressed: () {
                              String initialQuestion = _textController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AskPage(
                                    topic: 'General',
                                    initialQuestion: initialQuestion,
                                  ),
                                ),
                              );
                            }),
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
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: suggestions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SuggestionWidget(
                              onTap: () {
                                setState(() {
                                  i = index;
                                  subjects = subjectsAll[index];
                                });
                              },
                              text: suggestions[index],
                              active: i == index ? true : false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 610,
                  child: ListView.builder(
                    itemCount: subjects.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SubjectWidget(
                        title: subjects[index].title,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AskPage(
                                topic: subjects[index].topic,
                                initialQuestion:
                                    subjects[index].initialQuestion,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
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
                        controller: _textSecondController,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: Colors.white)),
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
                            String initialQuestion = _textSecondController.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AskPage(
                                  topic: 'General',
                                  initialQuestion: initialQuestion,
                                ),
                              ),
                            );
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
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
