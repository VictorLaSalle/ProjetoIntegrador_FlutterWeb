import 'package:flutter/material.dart';

class ContainerShadow extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              color: Colors.orange,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75),
                )
              ]),
          alignment: Alignment.center,
          width: 1100,
          height: 550,
        ),
      ),
    );
  }
}
