import 'package:chat/components/second_text_button.dart';
import 'package:flutter/material.dart';

class SubjectWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SubjectWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: SecondTextButton(
        text: title,
        onPressed: onPressed,
      ),
    );
  }
}
