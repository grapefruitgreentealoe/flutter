// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/card.dart';
import 'package:toonflix/widgets/plan_card.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('../assets/images/man.JPG'),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'MONDAY 16',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(250, 250, 250, 0.8),
                ),
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'TODAY',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(250, 250, 250, 1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '·',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(178, 37, 129, 1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '17',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(118, 118, 118, 1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '18',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(118, 118, 118, 1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '19',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(118, 118, 118, 1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(118, 118, 118, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              PlanCard(
                nameList: const ['ALEX', 'HELENA', 'NANA'],
                name: 'DESING\nMEETING',
                code: 'EUR',
                startDay: '30',
                startMonth: '11',
                endDay: '20',
                endMonth: '12',
                icon: Icons.euro_rounded,
                bgColor: Color.fromRGBO(254, 247, 84, 1),
              ),
              SizedBox(
                height: 10,
              ),
              PlanCard(
                nameList: const ['ME', 'RECHARD', 'CIRY'],
                name: 'DESING\nPROJECT',
                code: 'EUR',
                plusCount: '4',
                startDay: '35',
                startMonth: '12',
                endDay: '10',
                endMonth: '14',
                icon: Icons.euro_rounded,
                bgColor: Color.fromRGBO(156, 107, 206, 1),
              ),
              SizedBox(
                height: 10,
              ),
              PlanCard(
                nameList: const ['DEN', 'NANA', 'MARK'],
                name: 'WEEKLY\nPLANNING',
                code: 'EUR',
                startDay: '00',
                startMonth: '15',
                endDay: '30',
                endMonth: '16',
                icon: Icons.euro_rounded,
                bgColor: Color.fromRGBO(161, 200, 78, 1),
              ),
            ],
          ),
        ),
      ),
    ));
//metarial이나 cupertino 위젯을 리턴해야한다. 어떤 family를 사용할것이냐. 난 둘다싫어? 그래도 선택해야함. root이므로
//flutter는 google꺼라서 meterial 앱이 더 보기 좋다. ios도 좋지만..  material선택하기
  }
}
