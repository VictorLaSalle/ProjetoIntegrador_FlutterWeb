import 'package:development/components/appbar/custom_appbar.dart';
import 'package:development/components/background.dart';
import 'package:development/components/charts.dart';
import 'package:development/components/container/containerShadow.dart';
import 'package:development/pages/principal/principal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:development/constants.dart';

class PrincipalPage extends StatelessWidget {
  final PrincipalController _controller = Get.put(PrincipalController());
  final PageController _pageView = PageController();

  Widget build(BuildContext context) {
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
          ElevatedButton(
              onPressed: () => _pageView.jumpToPage(1), child: Text("vai"))
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
                height: MediaQuery.of(Get.context!).size.height / 0.2,
                child: Charts([
                  SheetsData("Sim", _controller.respostas!.resposta1['sim']),
                  SheetsData("Não", _controller.respostas!.resposta1['nao'])
                ], pergunta1),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.2,
                child: Charts([
                  SheetsData("Sim", _controller.respostas!.resposta2['sim']),
                  SheetsData("Não", _controller.respostas!.resposta2['nao'])
                ], pergunta2),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.2,
                child: Charts([
                  SheetsData("Sim", _controller.respostas!.resposta3['sim']),
                  SheetsData("Não", _controller.respostas!.resposta3['nao'])
                ], pergunta3),
              ),
            )
          ])));
  }

  Widget getSet2() {
    return ContainerShadow(ContainerShadow(Obx(() => _controller.loading.value
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          )
        : Row(children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.2,
                child: Charts([
                  SheetsData("Sim", _controller.respostas!.resposta2['sim'])
                ], pergunta1),
              ),
            )
          ]))));
  }

  Widget getSet3() {
    return ContainerShadow(ContainerShadow(Obx(() => _controller.loading.value
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          )
        : Row(children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(Get.context!).size.width / 0.2,
                height: MediaQuery.of(Get.context!).size.height / 0.2,
                child: Charts([
                  SheetsData("Sim", _controller.respostas!.resposta3['sim'])
                ], pergunta1),
              ),
            )
          ]))));
  }
}
