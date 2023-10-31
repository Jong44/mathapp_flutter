import 'package:flutter/material.dart';

class CardMateri extends StatelessWidget {
  final color;
  final image;
  final title;

  const CardMateri(
      {super.key,
      required this.color,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), side: BorderSide(width: 2)),
      child: Container(
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.only(bottom: 7),
        width: 270,
        height: 170,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.fromBorderSide(BorderSide(width: 2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8)),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 50,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
