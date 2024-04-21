import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail.mode.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_poster.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getMovieId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.black,
          centerTitle: true,
          elevation: 10,
          toolbarHeight: 80,
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon:
                  // isClicked
                  //     ? const Icon(Icons.favorite_rounded)
                  //     :
                  const Icon(Icons.favorite_outlined),
            )
          ],
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        body: MovieListBox(widget: widget, webtoon: webtoon));
  }
}

class MovieListBox extends StatelessWidget {
  const MovieListBox({
    super.key,
    required this.widget,
    required this.webtoon,
  });

  final DetailScreen widget;
  final Future<WebtoonDetailModel> webtoon;

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
                Hero(
                  tag: widget.id,
                  child: WebtoonPoster(thumb: widget.thumb),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${snapshot.data!.genre} / ${snapshot.data!.age}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text('...');
                  }
                }),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
