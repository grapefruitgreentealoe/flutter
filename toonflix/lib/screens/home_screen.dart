import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/models/popular_movie.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> playingMovies = ApiService.getPlayingMovies();
  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> upcomingMovie = ApiService.getUpcomingMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                'Popular Movies',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            FutureBuilder(
              future: playingMovies,
              builder: (context, snapshot) {
                //snapshot을 이용하면 future의 상태를 알 수 있다.
                if (snapshot.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: makeList(snapshot, false),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                'Now in Cinemas',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            FutureBuilder(
              future: popularMovies,
              builder: (context, snapshot) {
                //snapshot을 이용하면 future의 상태를 알 수 있다.
                if (snapshot.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: makeList(snapshot, true),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                'Coming soon',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            FutureBuilder(
              future: upcomingMovie,
              builder: (context, snapshot) {
                //snapshot을 이용하면 future의 상태를 알 수 있다.
                if (snapshot.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: makeList(snapshot, true),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox makeList(AsyncSnapshot<List<MovieModel>> snapshot, bool? isSmall) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        scrollDirection: Axis.horizontal, //스크롤 방향
        itemCount: snapshot.data!.length, //한번에 얼마나 로딩할건지
        itemBuilder: (context, index) {
          var webtoon = snapshot.data![index];
          return Webtoon(
              title: webtoon.title,
              thumb: 'https://image.tmdb.org/t/p/w500${webtoon.backdrop_path}',
              key: Key('${webtoon.id}'),
              id: '${webtoon.id}');
        },
        separatorBuilder: (context, index) {
          //listview.separated를 사용할때 리스트 아이템 사이에 렌더됨.
          if (index != snapshot.data!.length - 1) {
            return const SizedBox(
              width: 10,
            );
          }
          return const Text('');
        },
      ),
    );
  }
}
