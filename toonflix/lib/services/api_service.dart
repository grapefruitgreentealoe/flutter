import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/popular_movie.dart';
import 'package:toonflix/models/movie_detail.mode.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String today = "today";
  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> webtoons = jsonDecode(response.body);
      for (var i in webtoons['results']!) {
        movieInstances.add(MovieModel.fromJson(i));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getPlayingMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> webtoons = jsonDecode(response.body);
      for (var i in webtoons['results']!) {
        movieInstances.add(MovieModel.fromJson(i));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getUpcomingMovie() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/now-playing');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> webtoons = jsonDecode(response.body);
      for (var i in webtoons['results']!) {
        movieInstances.add(MovieModel.fromJson(i));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieId(String id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      print(movie);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
