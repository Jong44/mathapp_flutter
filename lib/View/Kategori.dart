import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List color = <Color>[Color(0xffe4d7ff), Color(0xfffedfae), Color(0xffed8d8e)];

  List<dynamic> data = [];

  Future<void> getData() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/data.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    setState(() {
      data = jsonData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("assets/images/background/background.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                      ),
                    ),
                    Text(
                      "Quiz",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(
                      width: 35,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemExtent: 70,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 20),
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: color[index],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1.1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data[index]['title'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Iconsax.play))
                              ],
                            ),
                          );
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
