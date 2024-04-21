class MovieDetailModel {
  final String backdrop_path, title, overview;
  final double vote_average;
  final List<dynamic> genres;
  MovieDetailModel.fromJson(
      Map<String, dynamic> json) //named constructor 이름이 있는 클래스 생성자.
      : backdrop_path = json['backdrop_path'],
        title = json['title'],
        vote_average = json['vote_average'],
        overview = json['overview'],
        genres = json['genres'];
}


/**
 * 영화의 포스터. backdrop_path
영화의 제목. title
영화의 등급.vote_average
영화의 개요.overview
영화의 장르.genres.map name

 */

