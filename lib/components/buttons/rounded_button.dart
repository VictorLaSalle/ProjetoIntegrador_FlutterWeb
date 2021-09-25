import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final String text;
  final Function() onPressed;
  final double height;
  final double width = 140;
  
  RoundedButton({
    required this.text,
    required this.onPressed,
    required this.height
  });
  
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.text, style: TextStyle(color: Colors.orange)),
      onPressed: this.onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        primary: Colors.white,
      ),
    );
  }
}