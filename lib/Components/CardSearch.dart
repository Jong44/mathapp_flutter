import 'package:flutter/material.dart';

class CardSearch extends StatelessWidget {
  final title;
  final description;

  const CardSearch({super.key, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xffCAE7EB),
                offset: Offset(0, 7),
                blurRadius: 0,
                spreadRadius: 0)
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/background/segitiga.png'),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toString(),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  description.toString(),
                  maxLines: 2,
                ),
              ],
            ))
          ]),
    );
  }
}
