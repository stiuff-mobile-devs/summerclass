import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:summerclass/app/routes/app_routes.dart';

class MoviesController extends GetxController {
  MoviesController();

  final ImagePicker picker = ImagePicker();
  final ValueNotifier<XFile?> imageNotifier = ValueNotifier<XFile?>(null);

  void addNewMovie() {
    Get.toNamed(Routes.MOVIE_FORM);
  }

  final Map<String, String> movieForm = {
    'title': '',
    'description': '',
    'directors': '',
    'synopsis': '',
    'image': '',
  };

  Future<void> pickImage() async {
    try {
      final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        imageNotifier.value = picked;
        movieForm['image'] = picked.path;
      }
    } catch (e) {
      print('Erro ao selecionar imagem: $e');
    }
  }
}
