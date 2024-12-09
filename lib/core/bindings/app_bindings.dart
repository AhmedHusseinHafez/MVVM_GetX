import 'package:code_nes_lab_task/core/networking/dio_factory.dart';
import 'package:code_nes_lab_task/data/repositories/repo.dart';
import 'package:code_nes_lab_task/data/services/web_services.dart';
import 'package:get/get.dart';
import '../../view_models/item_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebServices>(() => WebServices(DioFactory.createAndSetupDio()));
    Get.lazyPut<Repo>(() => Repo(Get.find()));
    Get.lazyPut<ItemController>(() => ItemController(repo: Get.find()));
  }
}
