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
  // int counter = 0; //이건 final이 아니다. 변경이 가능한 값이니까
  // counter는 dart 클래스의 프로퍼티이지 , 상태관리를 하는 flutter의 기능이 아니다.
  List<int> numbers = [];
  bool showTitle = true;

  void onClicked() {
    setState(() {
      // counter += 1;
      numbers.add(numbers.length);
    });
  }

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(titleLarge: TextStyle(color: Colors.red)),
        ),
        home: Scaffold(
          backgroundColor: Color(0xFFF4EDDB),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showTitle ? MyLargeTitle() : Text('nothing'),
                IconButton(
                    onPressed: toggleTitle, icon: Icon(Icons.remove_red_eye))
              ],
            ),
          ),
        ));
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState(); //부모의 initState
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge?.color),
    );
  }
}
