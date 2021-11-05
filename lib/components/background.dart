import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.orange, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
    ));
  }
}
