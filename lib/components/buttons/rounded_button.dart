import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget _child;
  final Function() _onPressed;
  final double _height;
  final double _width = 140;
  final EdgeInsets? _margin = EdgeInsets.all(20);

  RoundedButton({required child, required onPressed, required height, margin})
      : this._child = child,
        this._onPressed = onPressed,
        this._height = height;

  Widget build(BuildContext context) {
    return Container(
      margin: this._margin,
      child: ElevatedButton(
        child: this._child,
        onPressed: this._onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(_width, _height),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          primary: Colors.white,
        ),
      ),
    );
  }
}
