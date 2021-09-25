import 'package:flutter/material.dart';

class WhiteTextField extends StatelessWidget {

  final String _hintText;
  final bool? _obscureText;
  final TextStyle _textStyle = TextStyle(color: Colors.white);

  WhiteTextField(this._hintText, {obscureText = false}) : this._obscureText = obscureText;

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
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
                )
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xff053D7A)
                )
            )
        ),
      ),
    );
  }
}