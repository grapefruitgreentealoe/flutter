import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail.mode.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';
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
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
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
        body: SingleChildScrollView(
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
                FutureBuilder(
                    future: episodes,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Flexible(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 13),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var episode = snapshot.data![index];
                                return Episode(
                                    episode: episode, webtoonId: widget.id);
                              }),
                        );
                      } else {
                        return Container();
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
