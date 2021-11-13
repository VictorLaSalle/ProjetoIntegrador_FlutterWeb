import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {

  BorderButton(this._text, this._icon, this._onTap, this._width, this._height);

  final IconData _icon;
  final String _text;
  final Function() _onTap;
  final double _width;
  final double _height;

  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.white
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(_text,
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.white
              ),),
            ),
            Icon(_icon, color: Colors.white,)
          ],
        )
      ),
      onTap: _onTap,
    );
  }
}