class MovieModel {
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;

  final bool adult;
  final List<dynamic> genre_ids;
  final int id, vote_count;
  final double popularity, vote_average;
  final bool video;

  MovieModel.fromJson(
      Map<String, dynamic> json) //named constructor 이름이 있는 클래스 생성자.
      : adult = json['adult'],
        backdrop_path = json['backdrop_path'],
        genre_ids = json['genre_ids'],
        id = json['id'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        poster_path = json['poster_path'],
        release_date = json['release_date'],
        title = json['title'],
        video = json['video'],
        vote_average = json['vote_average'],
        vote_count = json['vote_count'];
}
