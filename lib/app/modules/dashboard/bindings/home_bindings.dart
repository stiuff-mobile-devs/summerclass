import 'package:get/get.dart';
import 'package:summerclass/app/modules/dashboard/controller/home_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
