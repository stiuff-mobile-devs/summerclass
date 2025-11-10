import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:summerclass/app/modules/dashboard/bindings/home_bindings.dart';
import 'package:summerclass/app/modules/dashboard/ui/home_page.dart';
import 'package:summerclass/app/modules/movies/bindings/movies_bindings.dart';
import 'package:summerclass/app/modules/movies/ui/movie_form.dart';
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

    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [HomePageBinding(), MoviesBindings()],
    ),

    GetPage(
      name: Routes.MOVIE_FORM,
      page: () => MovieForm(),
      binding: MoviesBindings(),
    ),
  ];
}
