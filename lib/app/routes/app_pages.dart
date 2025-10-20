import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:summerclass/app/modules/splash/bindings/splash_bindings.dart';
import 'package:summerclass/app/modules/splash/ui/splash_page.dart';
import 'package:summerclass/app/routes/app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
