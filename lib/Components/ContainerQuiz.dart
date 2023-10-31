import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:math/View/Kategori.dart';
import 'dart:math';

class ContainerQuiz extends StatelessWidget {
  const ContainerQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: -3 * pi / 180,
        child: Container(
            margin: EdgeInsets.only(right: 20),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 1), color: Colors.white),
            child: Transform.rotate(
                angle: 3 * pi / 180,
                child: DottedBorder(
                  strokeWidth: 2,
                  dashPattern: [3],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ayo Bermain Quiz",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Kerjakan  Quiz di setiap materinya untuk menjadi lebih paham")
                          ],
                        )),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Kategori()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: Colors.green.shade300,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Quiz",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
