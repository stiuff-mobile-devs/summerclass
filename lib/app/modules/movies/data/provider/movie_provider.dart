import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summerclass/app/modules/movies/data/model/movie_model.dart';

class MovieProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'movies';

  Future<void> addMovie(Movie movie) async {
    final docRef = _firestore.collection(_collectionName).doc();
    final movieWithId = Movie(
      id: docRef.id,
      title: movie.title,
      description: movie.description,
      directors: movie.directors,
      synopsis: movie.synopsis,
      imageBase64: movie.imageBase64,
    );
    await docRef.set(movieWithId.toJson());
  }

  Future<List<Movie>> getAllMovies() async {
    final snapshot = await _firestore.collection(_collectionName).get();
    return snapshot.docs.map((doc) => Movie.fromJson(doc.data())).toList();
  }
}
