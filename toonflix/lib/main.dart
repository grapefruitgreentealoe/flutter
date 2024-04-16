// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/card.dart';

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
                height: 20,
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
              CurrencyCard(
                name: 'EURO',
                code: 'EUR',
                amount: '6 428',
                icon: Icons.euro_rounded,
                isInverted: false,
              ),
              Transform.translate(
                offset: Offset(0, -20),
                child: CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 748',
                  icon: Icons.currency_bitcoin_rounded,
                  isInverted: true,
                ),
              ),
              Transform.translate(
                offset: Offset(0, -40),
                child: CurrencyCard(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '2 428',
                  icon: Icons.attach_money_outlined,
                  isInverted: false,
                ),
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
