import 'package:summerclass/app/modules/movies/data/provider/movie_provider.dart';
import 'package:summerclass/app/modules/movies/data/model/movie_model.dart';

class MovieRepository {
  final MovieProvider _provider = MovieProvider();

  Future<void> saveMovie(Movie movie) async {
    await _provider.addMovie(movie);
  }

  Future<List<Movie>> fetchMovies() async {
    return await _provider.getAllMovies();
  }
}
