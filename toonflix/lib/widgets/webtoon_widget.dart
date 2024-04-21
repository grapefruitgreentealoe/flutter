import 'package:flutter/material.dart';
import 'package:toonflix/widgets/detail_screen.dart';
import 'package:toonflix/widgets/webtoon_poster.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) =>
                  DetailScreen(title: title, thumb: thumb, id: id)),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: id,
            child: WebtoonPoster(thumb: thumb),
          ),
          const SizedBox(
            height: 0,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 22),
          )
        ],
      ),
    );
  }
}
