import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MainTextButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff644C8F),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Text(text, style: GoogleFonts.lato()),
    );
  }
}
