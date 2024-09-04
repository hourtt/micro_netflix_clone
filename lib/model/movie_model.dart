class Movie {
  final String title;
  final String backDropPath;
  //TODO: Add overview, posterPath, releaseDate
  final String overview;
  final String posterPath;
  final String releaseDate;

  Movie(
      {required this.title,
      required this.backDropPath,
      //TODO: Add overview, posterPath, releaseDate
      required this.overview,
      required this.posterPath,
      required this.releaseDate
      });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      //TODO: Add overview, posterPath, releaseDate. But you should know you have to use _ for bring data from map. Ex) backDropPath: map['backdropPath'] XXXXX  backDropPath: map['backdrop_path'] OOOO,
      overview: map['overview'],
      posterPath: map['poster_path'], //* Change from posterPath to poster_path
      releaseDate: map['release_date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backDropPath': backDropPath,
      //TODO: Add overview, posterPath, releaseDate.
      'overview': overview,
      'posterPath': posterPath,
      'release_date': releaseDate,
    };
  }
}
