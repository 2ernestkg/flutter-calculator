import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;
  final void Function()? buttonTap;
  const CalcButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.color,
    required this.buttonTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
