import 'package:get/get.dart';

class HomePageController extends GetxController {
  HomePageController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
