import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedBorderText extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsets padding;

  const RoundedBorderText({
    Key? key,
    required this.text,
    this.borderRadius = 20.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.padding = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
