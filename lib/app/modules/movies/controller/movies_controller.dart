import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:summerclass/app/modules/movies/data/repository/movie_repository.dart';
import 'package:summerclass/app/modules/movies/data/model/movie_model.dart';
import 'package:summerclass/app/modules/movies/service/image_service.dart';
import 'package:summerclass/app/routes/app_routes.dart';

class MoviesController extends GetxController {
  MoviesController();

  final MovieRepository _repository = MovieRepository();
  final ImageService _imageService = ImageService();
  final RxList<Movie> movies = <Movie>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isProcessingImage = false.obs;

  final ImagePicker picker = ImagePicker();
  final ValueNotifier<XFile?> imageNotifier = ValueNotifier<XFile?>(null);

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  Future<void> loadMovies() async {
    isLoading.value = true;
    try {
      movies.value = await _repository.fetchMovies();
    } catch (e) {
      print('Erro ao carregar filmes: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void addNewMovie() {
    Get.toNamed(Routes.MOVIE_FORM);
  }

  final Map<String, String> movieForm = {
    'title': '',
    'description': '',
    'directors': '',
    'synopsis': '',
    'imageBase64': '',
  };

  Future<void> saveMovie() async {
    try {
      final movie = Movie(
        title: movieForm['title']!,
        description: movieForm['description']!,
        directors: movieForm['directors']!,
        synopsis: movieForm['synopsis']!,
        imageBase64: movieForm['imageBase64']!.isNotEmpty
          ? movieForm['imageBase64']
          : null,
      );
      await _repository.saveMovie(movie);
      await loadMovies();
    } catch (e) {
      print('Erro ao salvar filme: $e');
      rethrow;
    }
  }

  Future<void> pickImage() async {
    try {
      final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        imageNotifier.value = picked;

        isProcessingImage.value = true;
        final base64Image = await _imageService.compressAndEncodeImage(picked.path);
        isProcessingImage.value = false;

        if (base64Image != null) {
          movieForm['imageBase64'] = base64Image;
        } else {
          Get.snackbar(
            'Erro',
            'Não foi possível processar a imagem',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      isProcessingImage.value = false;
      print('Erro ao selecionar imagem: $e');
    }
  }
}
