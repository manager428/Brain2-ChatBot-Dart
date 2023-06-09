import 'package:flutter/material.dart';

class RoundedSecondIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const RoundedSecondIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: const Color(0xff644C8F),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white70,
        splashColor: const Color(0xff644C8F),
        highlightColor: const Color(0xff644C8F),
        tooltip: 'Close',
        padding: const EdgeInsets.all(10.0),
        iconSize: 25.0,
        constraints: const BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0,
        ),
      ),
    );
  }
}
