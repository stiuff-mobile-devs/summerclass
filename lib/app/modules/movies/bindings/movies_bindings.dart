import 'package:get/get.dart';
import 'package:summerclass/app/modules/movies/controller/movies_controller.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesController>(() => MoviesController());
  }
}
