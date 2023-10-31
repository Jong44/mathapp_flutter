import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:math/Components/CardSearch.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<dynamic> data = [];
  List<dynamic> dataSearch = [];

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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80, right: 25, left: 25),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: TextField(
                        onChanged: ((value) {
                          setState(() {
                            if (value.isEmpty) {
                              dataSearch.clear();
                            } else {
                              dataSearch = data
                                  .where((item) => item['title']
                                      .toLowerCase()
                                      .contains(value))
                                  .toList();
                            }
                          });
                        }),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            hintText: "Search",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: Icon(Iconsax.search_normal_1)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(25),
                    itemCount: dataSearch.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                              child: CardSearch(
                                  description: data[index]['description'],
                                  title: data[index]['title'])),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    }))
          ],
        )
      ],
    ));
  }
}
