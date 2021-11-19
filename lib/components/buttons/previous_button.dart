import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  PreviousButton(this._onPressed);
  final Function() _onPressed;

  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: this._onPressed,
    );
  }
}
