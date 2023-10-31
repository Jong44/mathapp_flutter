import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Iconsax.arrow_left_2,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Menghitung Sudut",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          Padding(
              padding:
                  EdgeInsets.only(right: 20, left: 45, top: 13, bottom: 13),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(width: 1, color: Colors.black))),
                onPressed: () {},
                child: Text(
                  "Quiz",
                  style: TextStyle(color: Colors.black),
                ),
              ))
        ],
      ),
    );
  }
}
