import 'package:cafe_project/main.dart';
import 'package:flutter/material.dart';

class coffee extends StatefulWidget {
  const coffee({super.key});

  @override
  State<coffee> createState() => _coffeeState();
}

class _coffeeState extends State<coffee> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 4,
          childAspectRatio: (1 / 1.2),
          children: [
            _item(
                images: 'TaamJaiCafe/coffee/Americano.jpg',
                item: '10item',
                price: '2.99\$',
                title: 'Americano')
          ],
        )
      ],
    );
  }

  Widget _item({
    required String images,
    required String title,
    required String price,
    required String item,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: backgroundcolor,
        image: DecorationImage(image: AssetImage(images), fit: BoxFit.cover),
      ),
    );
  }
}
