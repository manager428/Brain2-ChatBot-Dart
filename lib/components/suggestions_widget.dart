import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool active;

  const SuggestionWidget(
      {Key? key, required this.onTap, required this.text, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return active
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
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
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xff644C8F), width: 1),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xff191922),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xff644C8F), width: 1),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
  }
}
