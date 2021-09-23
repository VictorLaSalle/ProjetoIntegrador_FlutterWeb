import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  
  final Widget child;
  final Function() onPressed;
  final double height;
  final double width = 140;
  
  RoundedButton({
    required this.child,
    required this.onPressed,
    required this.height
  });
  
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: this.child,
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