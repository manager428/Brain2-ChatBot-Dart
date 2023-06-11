import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const SettingItem(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff191922),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 26,
            ),
            const SizedBox(
              width: 41,
            ),
            Text(
              text,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
