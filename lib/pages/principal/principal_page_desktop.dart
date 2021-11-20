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

class PrincipalPageDesktop extends StatelessWidget {
  final PrincipalController _controller = Get.find<PrincipalController>();

  Widget build(BuildContext context) {
    final PageController _pageView =
        PageController(initialPage: _controller.indexPageDesktop.value);

    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 40, right: 50),
        child: FloatingActionButton(
          child: Icon(Icons.refresh, color: Colors.white),
          onPressed: () async => _controller.getData(),
          backgroundColor: Colors.orange,
        ),
      ),
      appBar: CustomAppbar(
        centerTitle: true,
        title: Text("ACICC"),
        leading: IconButton(
            onPressed: () async => await _controller.logout(),
            icon: Icon(Icons.logout)),
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
          Obx(() => _controller.indexPageDesktop.value < 2
              ? Container(
                  margin: EdgeInsets.only(right: 40),
                  alignment: Alignment.centerRight,
                  child: NextButton(() => _pageView
                      .jumpToPage(_controller.incrementIndexDesktop())))
              : Container()),
          Obx(() => _controller.indexPageDesktop.value > 0
              ? Container(
                  margin: EdgeInsets.only(left: 40),
                  alignment: Alignment.centerLeft,
                  child: PreviousButton(() => _pageView
                      .jumpToPage(_controller.decrementIndexDesktop())))
              : Container())
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
                      "Sim",
                      (_controller.respostas.value.resposta1!['sim'] as double)
                          .toPrecision(2)),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta1!['nao'] as double)
                          .toPrecision(2)
                          .toPrecision(2))
                ], pergunta1),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim",
                      (_controller.respostas.value.resposta2!['sim'] as double)
                          .toPrecision(2)),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta2!['nao'] as double)
                          .toPrecision(2))
                ], pergunta2),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim",
                      (_controller.respostas.value.resposta3!['sim'] as double)
                          .toPrecision(2)),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta3!['nao'] as double)
                          .toPrecision(2))
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
                    "Sim",
                    (_controller.respostas.value.resposta4!['sim'] as double)
                        .toPrecision(2)
                        .toPrecision(2),
                  ),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta4!['nao'] as double)
                          .toPrecision(2)
                          .toPrecision(2))
                ], pergunta4),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim",
                      (_controller.respostas.value.resposta5!['sim'] as double)
                          .toPrecision(2)
                          .toPrecision(2)),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta5!['nao'] as double)
                          .toPrecision(2)
                          .toPrecision(2))
                ], pergunta5),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim",
                      (_controller.respostas.value.resposta6!['sim'] as double)
                          .toPrecision(2)),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta6!['nao'] as double)
                          .toPrecision(2))
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
                      "Sim",
                      (_controller.respostas.value.resposta7!['sim'] as double)
                          .toPrecision(2)),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta7!['nao'] as double)
                          .toPrecision(2))
                ], pergunta7),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim",
                      (_controller.respostas.value.resposta8!['sim'] as double)
                          .toPrecision(2)),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta8!['nao'] as double)
                          .toPrecision(2))
                ], pergunta8),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.1,
                child: Charts([
                  SheetsData(
                      "Sim",
                      (_controller.respostas.value.resposta9!['sim'] as double)
                          .toPrecision(2)),
                  SheetsData(
                      "Não",
                      (_controller.respostas.value.resposta9!['nao'] as double)
                          .toPrecision(2))
                ], pergunta9),
              ),
            )
          ])));
  }
}
