class Movie {
  final String title;
  final String backDropPath;
  //TODO: Add overview, posterPath, releaseDate

  Movie({
    required this.title,
    required this.backDropPath,
    //TODO: Add overview, posterPath, releaseDate
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      //TODO: Add overview, posterPath, releaseDate. But you should know you have to use _ for bring data from map. Ex) backDropPath: map['backdropPath'] XXXXX  backDropPath: map['backdrop_path'] OOOO,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backDropPath': backDropPath,
      //TODO: Add overview, posterPath, releaseDate.
    };
  }
}
