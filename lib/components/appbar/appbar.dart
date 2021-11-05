import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Appbar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: const Text('ACCIC'),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: new IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Atualizar Dados',
              onPressed: () => Navigator.of(context),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
