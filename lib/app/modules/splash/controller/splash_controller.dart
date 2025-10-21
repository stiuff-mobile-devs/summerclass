import 'package:get/get.dart';
import 'package:summerclass/app/routes/app_routes.dart';

class SplashController extends GetxController {
  SplashController();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 5));
    isLoading.value = false;
    finishLoading();
  }

  goToHomePage() {
    Get.offAllNamed(Routes.HOME);
  }

  void finishLoading() {
    Future.microtask(() => goToHomePage());
  }
}
