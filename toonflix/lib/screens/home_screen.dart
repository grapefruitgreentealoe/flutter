import 'dart:async';
import 'package:flutter/material.dart';

class HomseScreen extends StatefulWidget {
  const HomseScreen({super.key});

  @override
  State<HomseScreen> createState() => _HomseScreenState();
}

class _HomseScreenState extends State<HomseScreen> {
  int checkedTime = 25;
  int totalSeconds = 25;
  bool isRunning = false;
  int totalPomodoros = 0;
  bool isRestTime = false;
  late Timer timer;

  get scrollController => null; //나중에 지정해준다

  void onTick(Timer timer) {
    if (totalSeconds == 0 && !isRestTime) {
      totalSeconds = 6;
      totalPomodoros += 1;
      isRestTime = true;
    } else if (isRestTime && totalSeconds == 0) {
      setState(() {
        isRestTime = false;
        isRunning = false;
        totalSeconds = checkedTime;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = isRestTime ? 6 : checkedTime;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        isRestTime ? Colors.green : Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Flexible(
              flex: 2,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    format(totalSeconds),
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600),
                  ))),
          isRunning
              ? const Text("")
              : Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var i in [1, 20, 25, 30, 35])
                            Container(
                              decoration: const BoxDecoration(),
                              child: TextButton(
                                  onPressed: () => {
                                        setState(() {
                                          checkedTime = i;
                                          totalSeconds = i;
                                        })
                                      },
                                  style: ButtonStyle(
                                    alignment: Alignment.center,
                                    backgroundColor: checkedTime == i
                                        ? MaterialStatePropertyAll(
                                            Theme.of(context).cardColor)
                                        : MaterialStatePropertyAll(
                                            backgroundColor),
                                  ),
                                  child: Text(
                                    '$i',
                                    style: TextStyle(
                                      color: checkedTime == i
                                          ? backgroundColor
                                          : Theme.of(context).cardColor,
                                      fontSize: 50,
                                    ),
                                  )),
                            ),
                        ]),
                  )),
          Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline),
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: onResetPressed,
                      icon: const Icon(Icons.replay),
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration:
                            BoxDecoration(color: Theme.of(context).cardColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Round',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .color)),
                                Text(
                                  '${totalPomodoros % 4}/4',
                                  style: TextStyle(
                                    fontSize: 58,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Goal',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .color)),
                                Text(
                                  '${(totalPomodoros / 4).floor()}/12',
                                  style: TextStyle(
                                    fontSize: 58,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
