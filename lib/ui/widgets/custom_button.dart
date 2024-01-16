import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontsize;
  final Color backgroundColor;

  CustomElevatedButton({
    required this.buttonText,
    required this.onPressed,
    this.width = 200,
    this.height = 48,
    this.backgroundColor = Colors.blue,
    this.fontsize = 24, // Valor predeterminado es azul
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        fixedSize: Size(width, height),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: fontsize),
      ),
    );
  }
}
