import 'package:development/components/appbar/custom_appbar.dart';
import 'package:development/components/background.dart';
import 'package:development/components/buttons/next_button.dart';
import 'package:development/components/buttons/previous_button.dart';
import 'package:development/components/charts.dart';
import 'package:development/components/container/containerShadow.dart';
import 'package:development/pages/principal/principal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:development/constants.dart';

class PrincipalPage extends StatelessWidget {
  final PrincipalController _controller = Get.find<PrincipalController>();

  Widget build(BuildContext context) {
    final PageController _pageView =
        PageController(initialPage: _controller.indexPage.value);

    return Scaffold(
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text("ACICC"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        backgroundColor: Colors.orange,
        shadowColor: Colors.transparent,
      ),
      body: Container(
          child: Stack(
        children: [
          Background(),
          Center(
              child: PageView(
                  controller: _pageView,
                  children: [getSet1(), getSet2(), getSet3()],
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal)),
          Container(
              margin: EdgeInsets.only(right: 100),
              alignment: Alignment.centerRight,
              child: NextButton(
                  () => _pageView.jumpToPage(_controller.incrementIndex()))),
          Container(
              margin: EdgeInsets.only(left: 100),
              alignment: Alignment.centerLeft,
              child: PreviousButton(
                  () => _pageView.jumpToPage(_controller.decrementIndex())))
        ],
      )),
    );
  }

  Widget getSet1() {
    return ContainerShadow(Obx(() => _controller.loading.value
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          )
        : Row(children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta1!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta1!['nao'])
                ], pergunta1),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta2!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta2!['nao'])
                ], pergunta2),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta3!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta3!['nao'])
                ], pergunta3),
              ),
            )
          ])));
  }

  Widget getSet2() {
    return ContainerShadow(Obx(() => _controller.loading.value
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          )
        : Row(children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta4!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta4!['nao'])
                ], pergunta4),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta5!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta5!['nao'])
                ], pergunta5),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta6!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta6!['nao'])
                ], pergunta6),
              ),
            )
          ])));
  }

  Widget getSet3() {
    return ContainerShadow(Obx(() => _controller.loading.value
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          )
        : Row(children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta7!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta7!['nao'])
                ], pergunta7),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta8!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta8!['nao'])
                ], pergunta8),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim", _controller.respostas.value.resposta9!['sim']),
                  SheetsData(
                      "Não", _controller.respostas.value.resposta9!['nao'])
                ], pergunta9),
              ),
            )
          ])));
  }
}
