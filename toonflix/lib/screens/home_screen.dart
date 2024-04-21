import 'package:flutter/material.dart';
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
      appBar: AppBar(
        shadowColor: Colors.black,
        centerTitle: true,
        elevation: 10,
        toolbarHeight: 80,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder(
              future: playingMovies,
              builder: (context, snapshot) {
                //snapshot을 이용하면 future의 상태를 알 수 있다.
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: makeList(snapshot),
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
            FutureBuilder(
              future: upcomingMovie,
              builder: (context, snapshot) {
                //snapshot을 이용하면 future의 상태를 알 수 있다.
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: makeList(snapshot),
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

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
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
            width: 20,
          );
        }
        return const Text('');
      },
    );
  }
}
