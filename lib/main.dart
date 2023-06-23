import 'package:chat/components/main_text_button.dart';
import 'package:chat/pages/onboarding2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'components/rounded_border_text.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff191922)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 4));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff191922),
        child: Stack(children: [
          Image.asset(
            'assets/images/onboarding_logo.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.transparent,
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 269, left: 34, right: 34),
                  child: Text(
                    "The Power of AI in your Pocket",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 45,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24, left: 34, right: 34),
                  child: Text(
                    "Welcome to the new era of Al-powered conversations with Ask Al.",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 54, left: 15),
                  alignment: Alignment.centerLeft,
                  child: const RoundedBorderText(
                    text: 'Available in all languages',
                    borderRadius: 30.0,
                    borderColor: Colors.white24,
                    borderWidth: 1.0,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  alignment: Alignment.centerLeft,
                  child: const RoundedBorderText(
                    text: 'Al remembers your dialogue',
                    borderRadius: 30.0,
                    borderColor: Colors.white24,
                    borderWidth: 1.0,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      alignment: Alignment.centerLeft,
                      child: const RoundedBorderText(
                        text: 'Ask any question',
                        borderRadius: 30.0,
                        borderColor: Colors.white24,
                        borderWidth: 1.0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 8),
                      alignment: Alignment.centerLeft,
                      child: const RoundedBorderText(
                        text: 'Powered by GPT3.5',
                        borderRadius: 30.0,
                        borderColor: Colors.white24,
                        borderWidth: 1.0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35, left: 15, right: 15),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: MainTextButton(
                      text: "Let's go!",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Onboarding2Page()),
                        );
                      }),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 33, right: 33),
                  child: RichText(
                    text: TextSpan(
                      text: 'By continuing, you agree to our ',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.white54,
                        ),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Privacy Policy ',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Color(0xffffffff),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        TextSpan(
                          text: ' &.',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, left: 34, right: 34),
                  child: Text(
                    "Terms of Use",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 13,
                        color: Color(0xffffffff),
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ]),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
