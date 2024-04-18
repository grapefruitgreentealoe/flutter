import 'dart:async';

import 'package:flutter/material.dart';

class HomseScreen extends StatefulWidget {
  const HomseScreen({super.key});

  @override
  State<HomseScreen> createState() => _HomseScreenState();
}

class _HomseScreenState extends State<HomseScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer; //나중에 지정해준다

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
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
      totalSeconds = twentyFiveMinutes;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Pomodoros',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color)),
                            Text(
                              '$totalPomodoros',
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
                        )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
