import 'package:development/components/textfield/white_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './login_controller.dart';
import 'package:get/get.dart';
import '../../components/buttons/rounded_button.dart';
import '../../components/buttons/border_button.dart';

class LoginPageMobile extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_getLoginBox(context)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLoginBox(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.white,
          width: 4,
        )),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WhiteTextField(
                    'Email',
                    _email,
                    MediaQuery.of(context).size.width * 0.3,
                    EdgeInsets.only(top: 15)),
                SizedBox(height: 100),
                WhiteTextField('Senha', _password,
                    MediaQuery.of(context).size.width * 0.3, EdgeInsets.zero,
                    obscureText: true),
                _getUploadButton(),
                SizedBox(height: 75),
                RoundedButton(
                  text: 'Entrar',
                  onPressed: () => _controller.connect(
                      _email.value.text, _password.value.text),
                  height: 40,
                )
              ],
            ),
          ),
        ));
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

  Widget _getUploadButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: BorderButton(
          "Carregar arquivo",
          Icons.upload_rounded,
          _controller.loadPrivateKey,
          MediaQuery.of(Get.context!).size.width * 0.2,
          MediaQuery.of(Get.context!).size.height * 0.1),
    );
  }
}
