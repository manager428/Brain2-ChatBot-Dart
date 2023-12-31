import 'package:chat/pages/signin.dart';
import 'package:chat/pages/unlock.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toast/toast.dart';
import 'package:validators/validators.dart';
import '../apis/auth_service.dart';
import '../components/main_text_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  bool loading = false;
  @override
  void dispose() {
    emailEditingController.clear();
    passwordEditingController.clear();
    passConfirmController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CircularProgressIndicator(color: Colors.white),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff191922),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                        'https://assets3.lottiefiles.com/packages/lf20_zw0djhar.json',
                        animate: true,
                        height: 180,
                        width: 600),
                    Text(
                      'Sign Up Now',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Please sign up to continue using our app',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 275,
                      width: MediaQuery.of(context).size.width / 1.1,
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
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 20),
                            child: TextFormField(
                              controller: emailEditingController,
                              cursorColor: Colors.white,
                              style: GoogleFonts.lato(
                                  textStyle:
                                      const TextStyle(color: Colors.white)),
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Color(0xff191922),
                                labelText: "Email",
                                hintText: 'your-email@domain.com',
                                hintStyle: TextStyle(color: Colors.white70),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: passwordEditingController,
                              obscuringCharacter: '*',
                              obscureText: true,
                              cursorColor: Colors.white,
                              style: GoogleFonts.lato(
                                  textStyle:
                                      const TextStyle(color: Colors.white)),
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.key,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Color(0xff191922),
                                labelText: "Password",
                                hintText: '*********',
                                hintStyle: TextStyle(color: Colors.white70),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: passConfirmController,
                              obscuringCharacter: '*',
                              obscureText: true,
                              cursorColor: Colors.white,
                              style: GoogleFonts.lato(
                                  textStyle:
                                      const TextStyle(color: Colors.white)),
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.key,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Color(0xff191922),
                                labelText: "Confirm Password",
                                hintText: '*********',
                                hintStyle: TextStyle(color: Colors.white70),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 35, left: 15, right: 15),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: MainTextButton(
                          text: "Sign Up",
                          onPressed: () async {
                            String email = emailEditingController.text;
                            String password = passwordEditingController.text;
                            String passConfirm = passConfirmController.text;
                            if (!isEmail(email)) {
                              Toast.show(
                                'Email is invalid, please enter a valid email',
                                duration: 3,
                                gravity: Toast.bottom,
                                backgroundColor: Colors.red,
                              );
                              return;
                            }
                            if (!isLength(password, 8)) {
                              Toast.show(
                                'Password must be at least 8 characters.',
                                duration: 3,
                                gravity: Toast.bottom,
                                backgroundColor: Colors.red,
                              );
                              return;
                            }
                            if (password != passConfirm) {
                              Toast.show(
                                'Your password and confirmation password do not match.',
                                duration: 3,
                                gravity: Toast.bottom,
                                backgroundColor: Colors.red,
                              );
                              return;
                            }
                            setState(() {
                              loading = true;
                            });
                            final message = await AuthService().registration(
                              email: email,
                              password: password,
                            );
                            if (message!.contains('Success')) {
                              setState(() {
                                loading = false;
                              });
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UnlockPage()),
                              );
                              Toast.show(
                                'You have successfully registered...',
                                duration: 3,
                                gravity: Toast.bottom,
                                backgroundColor: Colors.green,
                              );
                            } else {
                              setState(() {
                                loading = false;
                              });
                              Toast.show(
                                message,
                                duration: 3,
                                gravity: Toast.bottom,
                                backgroundColor: Colors.red,
                              );
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'You already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Color.fromARGB(255, 97, 247, 234),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
