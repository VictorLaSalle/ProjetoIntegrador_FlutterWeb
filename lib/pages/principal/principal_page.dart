import 'package:development/components/appbar/custom_appbar.dart';
import 'package:development/components/background.dart';
import 'package:development/components/charts.dart';
import 'package:development/components/container/containerShadow.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text("ACICC"),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
        backgroundColor: Colors.orange,
        shadowColor: Colors.transparent,
      ),
      body: Container(
          child: Stack(
            children: [
              Background(),

            ],
          )
      ),
    );
  }
}