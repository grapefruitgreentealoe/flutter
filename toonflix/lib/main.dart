// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//위젯을 만들기 위해 flutter SDK에 있는 3개의 core Widget 중 하나를 상속받아야한다.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // const App({super.key});
  int counter = 0; //이건 final이 아니다. 변경이 가능한 값이니까
  void onClicked() {
    counter += 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFFF4EDDB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Click Count',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$counter',
              style: TextStyle(fontSize: 30),
            ),
            IconButton(
                iconSize: 30,
                onPressed: onClicked,
                icon: Icon(
                  Icons.add_box_rounded,
                ))
          ],
        ),
      ),
    ));
  }
}
