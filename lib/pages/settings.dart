import 'package:chat/components/second_text_button.dart';
import 'package:chat/components/setting_item_widget.dart';
import 'package:chat/models/setting_item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../components/main_text_button.dart';
import '../components/rounded_icon_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  List<SettingItemModel> settingItems = [
    const SettingItemModel(
        text: 'E-mail Support', icon: FontAwesomeIcons.envelope),
    const SettingItemModel(
        text: 'Restore Purchase', icon: FontAwesomeIcons.rotate),
    const SettingItemModel(
        text: 'Share Ask AI', icon: FontAwesomeIcons.arrowUpFromBracket),
    const SettingItemModel(text: 'About', icon: FontAwesomeIcons.circleInfo),
    const SettingItemModel(
        text: 'Like us, Rate us?', icon: FontAwesomeIcons.star),
    const SettingItemModel(
        text: 'Follow on Reddit', icon: FontAwesomeIcons.reddit),
    const SettingItemModel(
        text: 'Follow on Twitter', icon: FontAwesomeIcons.twitter),
    const SettingItemModel(
        text: 'Privacy Policy', icon: FontAwesomeIcons.circleCheck),
    const SettingItemModel(
        text: 'Terms of Service', icon: FontAwesomeIcons.book),
    const SettingItemModel(
        text: 'Community Guideline', icon: FontAwesomeIcons.noteSticky),
    const SettingItemModel(
        text: 'Allow Notification', icon: FontAwesomeIcons.bell),
  ];
  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff191922),
          shadowColor: const Color.fromARGB(135, 19, 19, 26),
          title: Column(
            children: <Widget>[
              const Icon(
                FontAwesomeIcons.bell,
                color: Colors.white,
                size: 35,
              ),
              const SizedBox(width: 42),
              Container(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Text(
                  "Don't miss new releasing prompts, special offers and more by allowing notifications.",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(top: 45, left: 5, right: 5),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: MainTextButton(text: "Allow Now", onPressed: () {}),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: SecondTextButton(text: "Allow Now", onPressed: () {}),
              ),
            ],
          ),
          content: const Text('Are you sure you want to proceed?'),
        );
      },
    );
  }

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
                    'Settings',
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
                itemCount: settingItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return SettingItem(
                      text: settingItems[index].text,
                      icon: settingItems[index].icon,
                      onPressed: () {
                        if (index == 2) {
                          String message =
                              'Please use this wonderful app. \n Google Play: https://google.play.com/ \n Apple Store: https://apps.apple.com';
                          Share.share(message);
                        } else {
                          _showConfirmationDialog(context);
                        }
                      });
                },
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
