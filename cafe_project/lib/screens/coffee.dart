import 'package:cafe_project/main.dart';
import 'package:flutter/material.dart';

class coffee extends StatefulWidget {
  const coffee({super.key});

  @override
  State<coffee> createState() => _coffeeState();
}

class _coffeeState extends State<coffee> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Americano",
      "price": "\$5.99",
      "image": "TaamJaiCafe/coffee/Americano.jpg"
    },
    {
      "title": "Americano",
      "price": "\$5.99",
      "image": "TaamJaiCafe/coffee/Americano.jpg"
    },
    {
      "title": "Americano",
      "price": "\$5.99",
      "image": "TaamJaiCafe/coffee/Americano.jpg"
    },
    {
      "title": "Americano",
      "price": "\$5.99",
      "image": "TaamJaiCafe/coffee/Americano.jpg"
    },
    {
      "title": "Americano",
      "price": "\$5.99",
      "image": "TaamJaiCafe/coffee/Americano.jpg"
    },
    {
      "title": "Americano",
      "price": "\$5.99",
      "image": "TaamJaiCafe/coffee/Americano.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 30,
            mainAxisExtent: 240),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: backgroundcolor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(4, 4))
                ]),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  child: Image.asset("${gridMap.elementAt(index)['image']}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${gridMap.elementAt(index)['title']}",
                        style: TextStyle(
                            color: textcolors,
                            fontSize: 26,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "${gridMap.elementAt(index)['price']}",
                        style: TextStyle(color: textcolors, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
