import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondTextButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
            side: const BorderSide(color: Color(0xff644C8F))),
      ),
      child: Text(text, style: GoogleFonts.lato()),
    );
  }
}
