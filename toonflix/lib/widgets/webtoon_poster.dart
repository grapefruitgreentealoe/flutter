import 'package:flutter/material.dart';

class WebtoonPoster extends StatelessWidget {
  const WebtoonPoster({
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
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: const Offset(10, 10),
              color: Colors.black.withOpacity(0.5),
            ),
          ]),
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
