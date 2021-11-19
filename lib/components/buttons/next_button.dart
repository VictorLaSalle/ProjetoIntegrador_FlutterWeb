import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  NextButton(this._onPressed);
  final Function() _onPressed;

  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      onPressed: this._onPressed,
    );
  }
}
