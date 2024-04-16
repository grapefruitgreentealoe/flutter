import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlanCard extends StatelessWidget {
  final String name, code;
  final IconData icon;
  final Color bgColor;
  final String startMonth, startDay, endMonth, endDay;
  final List<String> nameList;
  final String? plusCount;

  final _blackColor = const Color(0XFF1F2123);
  const PlanCard({
    super.key,
    required this.name,
    required this.code,
    required this.icon,
    required this.bgColor,
    required this.startDay,
    required this.startMonth,
    required this.endDay,
    required this.endMonth,
    required this.nameList,
    this.plusCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        startMonth,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            height: 0.8),
                      ),
                      Text(
                        startDay,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        height: 25,
                        width: 1,
                        color: Colors.black,
                      ),
                      Text(
                        endMonth,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            height: 0.8),
                      ),
                      Text(
                        endDay,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 55,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(children: [
                            for (var name in nameList)
                              Row(children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    color: name == 'ME'
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.4),
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ])
                          ]),
                          const SizedBox(
                            width: 5,
                          ),
                          Visibility(
                            visible: plusCount != null ? true : false,
                            child: Text(
                              "+$plusCount",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
