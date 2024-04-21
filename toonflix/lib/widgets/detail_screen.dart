import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_detail.mode.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/movie_poster.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;
  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outlined),
          )
        ],
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder<MovieDetailModel>(
        future: movie,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());

            // return const Text('ll');
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return _buildBody(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _buildBody(MovieDetailModel movieDetail) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://image.tmdb.org/t/p/w500/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg"), // Assuming there's a field called imageUrl in MovieDetailModel
          fit: BoxFit.cover,
        ),
      ),
      child: MovieInfo(widget: widget, movie: movie),
    );
  }
}

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
    required this.widget,
    required this.movie,
  });

  final DetailScreen widget;
  final Future<MovieDetailModel> movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MoviePoster(thumb: widget.thumb),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
