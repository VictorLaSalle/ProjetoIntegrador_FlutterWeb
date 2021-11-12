import 'package:development/gateways/local_storage.dart';
import 'package:get/get.dart';

class InitialBindings {
  final LocalStorage localStorage = Get.put(LocalStorage.instance);
}