import 'dart:convert';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:math/Components/CardMateri.dart';
import 'package:math/Components/ContainerQuiz.dart';
import 'package:math/View/Kategori.dart';
import 'package:math/View/MateriPage.dart';
import 'package:math/View/Search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List color = <Color>[Color(0xffcae7eb), Color(0xffd87089), Color(0xfffcba1e)];

  List image = [
    "assets/images/background/image_30.png",
    "assets/images/background/image_31.png",
    "assets/images/background/image_32.png"
  ];

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
                  image: AssetImage("assets/images/background/background.png"),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70, right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    },
                    icon: Icon(Iconsax.search_normal_1, size: 30),
                  ),
                ),
              ),
              Text(
                "Hi, Kawan",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Belajar apa hari ini?",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Materi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MateriPage()));
                            },
                            child: CardMateri(
                                color: color[index],
                                image: image[index],
                                title: data[index]['title']),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Semua Quiz",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              SizedBox(
                height: 20,
              ),
              ContainerQuiz()
            ],
          ),
        )
      ],
    ));
  }
}
