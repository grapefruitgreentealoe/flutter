import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.thumb,
  });

  final String thumb;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      width: 250,
      child: Image.network(
        thumb,
        headers: const {
          'Referer': 'https://comic.naver.com',
        },
      ),
    );
  }
}
