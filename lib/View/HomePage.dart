import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:math/View/Kategori.dart';
import 'package:math/View/Search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List color = <Color>[
    Color(0xffcae7eb),
    Color(0xffd87089),
    Color(0xfffcba1e)
  ];

  List image = [
    "asset/image_30.png",
    "asset/image_31.png",
    "asset/image_32.png"
  ];
  
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
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Search())
                        );
                      },
                      icon: Icon(Iconsax.search_normal_1, size: 30),
                    ),
                  ),
                ),
                Text("Hi, Kawan", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Text("Belajar apa hari ini?", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
                SizedBox(height: 70,),
                Text("Materi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 0,
                              color: color[index],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      width: 2
                                  )
                              ),
                              child: Container(
                                padding: EdgeInsets.all(7),
                                margin: EdgeInsets.only(bottom: 7),
                                width: 270,
                                height: 170,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.fromBorderSide(BorderSide(width: 2))
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                          image: DecorationImage(
                                            image: AssetImage(image[index]),
                                            fit: BoxFit.cover
                                          )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 50,
                                      child: Text(
                                        "Menghitung Sudut Segitiga",
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20,)
                          ],
                        );
                      }),
                ),
                SizedBox(height: 60,),
                Text("Semua Quiz", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                SizedBox(height: 20,),
                Transform.rotate(
                    angle: -3 * pi / 180,
                    child: Container(
                        margin: EdgeInsets.only(right: 20),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: Colors.white
                        ),
                        child: Transform.rotate(
                            angle: 3 * pi / 180,
                            child: DottedBorder(
                              strokeWidth: 2,
                              dashPattern: [3],
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Ayo Bermain Quiz", style: TextStyle(fontWeight: FontWeight.bold),),
                                            SizedBox(height: 10,),
                                            Text("Kerjakan  Quiz di setiap materinya untuk menjadi lebih paham")
                                          ],
                                        )
                                    ),
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
                                                color: Colors.black
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Kategori()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 10),
                                              alignment: Alignment.center,
                                              width: 60,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 1),
                                                  color: Colors.green.shade300,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Text("Quiz", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                        )
                    )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
