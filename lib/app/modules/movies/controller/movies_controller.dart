import 'package:get/get.dart';

class MoviesController extends GetxController {
  MoviesController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
