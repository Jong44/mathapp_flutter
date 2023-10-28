import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                    image: AssetImage("asset/background.png"),
                    fit: BoxFit.cover
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 80, left: 25, right: 25,bottom: 10),
                padding: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white
                ),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      hintText: "Search",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Iconsax.search_normal_1)
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(25),
                      itemCount: 2,
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            InkWell(
                              child: Container(
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
                                      spreadRadius: 0
                                    )
                                  ]
                                ),
                              ),
                            ),
                            SizedBox(height: 30,)
                          ],
                        );
                      }
                  )
              )
            ],
          )
        ],
      )
    );
  }
}
