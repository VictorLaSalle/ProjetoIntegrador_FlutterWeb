import 'package:development/components/buttons/border_button.dart';
import 'package:development/components/textfield/white_textfield.dart';
import 'package:flutter/material.dart';
import './login_controller.dart';
import 'package:get/get.dart';
import '../../components/buttons/rounded_button.dart';

class LoginPageDesktop extends StatelessWidget {
  final LoginController _controller = Get.find<LoginController>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.23,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.white,
        width: 4,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WhiteTextField('Insira seu email', _email,
              MediaQuery.of(context).size.width * 0.15, EdgeInsets.zero),
          SizedBox(height: 50),
          WhiteTextField('Insira sua senha', _password,
              MediaQuery.of(context).size.width * 0.15, EdgeInsets.zero,
              obscureText: true),
          _getUploadButton(),
          RoundedButton(
            text: 'Entrar',
            onPressed: () =>
                _controller.connect(_email.value.text, _password.value.text),
            height: 40,
          )
        ],
      ),
    );
  }

  Widget _getBackground() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffF87F0A),
        Color(0xffF87F0A).withOpacity(0.6),
        Color(0xff053D7A).withOpacity(0.6),
        Color(0xff053D7A)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
              child: Image.asset(
                'lib/assets/assetLaSalle.png',
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              margin: EdgeInsets.only(right: 100),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Image.asset(
                'lib/assets/assetACICC.png',
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              margin: EdgeInsets.only(right: 100),
            )
          ],
        )
      ],
    );
  }

  Widget _getUploadButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: BorderButton(
          "Carregar arquivo",
          Icons.upload_rounded,
          _controller.loadPrivateKey,
          MediaQuery.of(Get.context!).size.width * 0.14,
          MediaQuery.of(Get.context!).size.height * 0.1),
    );
  }
}
