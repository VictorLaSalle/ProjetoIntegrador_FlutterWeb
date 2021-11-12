import 'package:flutter/material.dart';

class ContainerShadow extends StatelessWidget {

  ContainerShadow(this._child);

  Widget _child;

  Widget build(BuildContext context) {
    return Center(
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
                  offset: Offset(0.5, 0.5),
                )
              ]),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.4,
          child: this._child,
        ),
      );
  }
}
