import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//위젯을 만들기 위해 flutter SDK에 있는 3개의 core Widget 중 하나를 상속받아야한다.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('hello world'),
        ),
        appBar: AppBar(
          title: Text('hello flutter~'),
          centerTitle: false,
        ),
      ),
    );
//metarial이나 cupertino 위젯을 리턴해야한다. 어떤 family를 사용할것이냐. 난 둘다싫어? 그래도 선택해야함. root이므로
//flutter는 google꺼라서 meterial 앱이 더 보기 좋다. ios도 좋지만..  material선택하기
  }
}
