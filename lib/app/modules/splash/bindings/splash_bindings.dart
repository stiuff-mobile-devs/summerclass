import 'package:get/get.dart';
import 'package:summerclass/app/modules/splash/controller/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
