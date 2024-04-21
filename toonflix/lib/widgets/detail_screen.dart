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
      body: Stack(children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bulb.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder<MovieDetailModel>(
            future: movie,
            builder: (context, snapshot) {
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
        ),
        FutureBuilder<MovieDetailModel>(
          future: movie,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBar(
                      title: const Text(
                        'Back to list',
                      ),
                      centerTitle: true,
                      toolbarHeight: 80,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data!.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_outlined,
                              color: Colors.amberAccent,
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: Colors.amberAccent,
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: Colors.amberAccent,
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: Colors.amberAccent,
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: Colors.amberAccent,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var genre in snapshot.data!.genres)
                              Text(genre['name'],
                                  style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        const Text('Storyline',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        Text(snapshot.data!.overview,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ),
      ]),
    );
  }

  Widget _buildBody(MovieDetailModel movieDetail) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              scale: BorderSide.strokeAlignOutside,
              "https://image.tmdb.org/t/p/w500${movieDetail.backdrop_path}"), // Assuming there's a field called imageUrl in MovieDetailModel
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
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
