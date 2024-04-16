// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';

void main() {
  runApp(App());
}

//위젯을 만들기 위해 flutter SDK에 있는 3개의 core Widget 중 하나를 상속받아야한다.
class App extends StatelessWidget {
  const App({super.key});

  // const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF181818),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Column(),
                Column(
                  children: [
                    Text(
                      'Hey,Eunsun',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 120,
            ),
            Text(
              'Total Balance',
              style: TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(250, 250, 250, 0.8),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$5 194 482',
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(250, 250, 250, 1),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Button(
                    text: 'Transfer',
                    bgColor: Colors.amber,
                    textColor: Color(0xFF1F2123)),
                Button(
                    text: 'Request',
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Wallets',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Color(0xFF1F2123),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Euro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                '6428',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'EUR',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Transform.scale(
                          scale: 2.2,
                          child: Transform.translate(
                            offset: const Offset(8, 15),
                            child: Icon(
                              Icons.euro_rounded,
                              color: Colors.white,
                              size: 88,
                            ),
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
//metarial이나 cupertino 위젯을 리턴해야한다. 어떤 family를 사용할것이냐. 난 둘다싫어? 그래도 선택해야함. root이므로
//flutter는 google꺼라서 meterial 앱이 더 보기 좋다. ios도 좋지만..  material선택하기
  }
}
