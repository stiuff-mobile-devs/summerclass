class Movie {
  final String? id;
  final String title;
  final String description;
  final String directors;
  final String synopsis;
  final String? imageBase64;

  Movie({
    this.id,
    required this.title,
    required this.description,
    required this.directors,
    required this.synopsis,
    this.imageBase64,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'directors': directors,
      'synopsis': synopsis,
      'imageBase64': imageBase64,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as String?,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      directors: json['directors'] as String? ?? '',
      synopsis: json['synopsis'] as String? ?? '',
      imageBase64: json['imageBase64'] as String?,
    );
  }
}
