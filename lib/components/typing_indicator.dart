import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypingIndicator extends StatefulWidget {
  final Color dotColor;
  final Duration dotDuration;

  const TypingIndicator(
      {super.key,
      this.dotColor = Colors.grey,
      this.dotDuration = const Duration(milliseconds: 500)});

  @override
  TypingIndicatorState createState() => TypingIndicatorState();
}

class TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _dotOneAnimation;
  late Animation<double> _dotTwoAnimation;
  late Animation<double> _dotThreeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.dotDuration * 3);
    _animationController.repeat();

    _dotOneAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.4),
    ));

    _dotTwoAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 0.6),
    ));

    _dotThreeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.6, 0.8),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 45,
        ),
        Container(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
          child: Text(
            "Thinking",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        _buildDot(animation: _dotOneAnimation, color: widget.dotColor),
        const SizedBox(width: 4.0),
        _buildDot(animation: _dotTwoAnimation, color: widget.dotColor),
        const SizedBox(width: 4.0),
        _buildDot(animation: _dotThreeAnimation, color: widget.dotColor),
      ],
    );
  }

  Widget _buildDot(
      {required Animation<double> animation, required Color color}) {
    return ScaleTransition(
      scale: animation,
      child: Container(
        margin: const EdgeInsets.only(top: 3),
        width: 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
