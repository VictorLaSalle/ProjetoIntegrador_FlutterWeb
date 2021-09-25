import 'package:development/components/textfield/white_textfield.dart';
import 'package:flutter/material.dart';
import './login_controller.dart';
import 'package:get/get.dart';
import '../../components/buttons/rounded_button.dart';

class Login extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getBackground(),
          Center(
            widthFactor: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_getLoginBox(context)],
            ),
          ),
          _getAssets(context)
        ],
      ),
    );
  }

  Widget _getLoginBox(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.5,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.23,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 4,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WhiteTextField('Insira seu email'),
          SizedBox(height: 100),
          WhiteTextField('Insira sua senha', obscureText: true),
          SizedBox(height: 75),
          RoundedButton(
            text: 'Entrar',
            onPressed: () {},
            height: 40,
          )
        ],
      ),
    );
  }

    Widget _getBackground() {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffF87F0A), Color(0xffF87F0A).withOpacity(0.6), Color(0xff053D7A).withOpacity(0.6), Color(0xff053D7A)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      );
    }

    Widget _getAssets(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Image.asset('lib/assets/assetLaSalle.png', height: MediaQuery.of(context).size.height * 0.4, width: MediaQuery.of(context).size.width * 0.4,),
                margin: EdgeInsets.only(right: 100),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Image.asset('lib/assets/assetACICC.png', height: MediaQuery.of(context).size.height * 0.4, width: MediaQuery.of(context).size.width * 0.4,),
                margin: EdgeInsets.only(right: 100),
              )
            ],
          )
        ],
      );
    }
  }
