// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//위젯을 만들기 위해 flutter SDK에 있는 3개의 core Widget 중 하나를 상속받아야한다.
class App extends StatelessWidget {
  const App({super.key});

  // const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFFF4EDDB),
      body: Container(),
    ));
  }
}
