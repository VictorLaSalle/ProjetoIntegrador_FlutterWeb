import 'package:flutter/material.dart';

class WhiteTextField extends StatelessWidget {
  final String _hintText;
  final bool? _obscureText;
  final TextStyle _textStyle = TextStyle(color: Colors.white);
  final double _width;
  EdgeInsets _margin;

  WhiteTextField(this._hintText, width, margin, {obscureText = false})
      : this._width = width,
        this._obscureText = obscureText,
        this._margin = margin;

  Widget build(BuildContext context) {
    return Container(
      margin: this._margin,
      width: _width,
      child: TextFormField(
        style: this._textStyle,
        cursorColor: Colors.white,
        obscureText: this._obscureText!,
        decoration: InputDecoration(
            hintText: this._hintText,
            hintStyle: this._textStyle,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff053D7A)))),
      ),
    );
  }
}
