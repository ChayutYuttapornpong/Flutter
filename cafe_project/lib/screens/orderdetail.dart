import 'package:cafe_project/main.dart';
import 'package:flutter/material.dart';

class orderdetail extends StatefulWidget {
  const orderdetail({super.key});

  @override
  State<orderdetail> createState() => _orderdetailState();
}

class _orderdetailState extends State<orderdetail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('TaamJaiCafe/coffee/Americano.jpg'),
                radius: 40,
              ),
              title: Text(
                'XXXX XXXXX',
                style:
                    TextStyle(color: textcolors, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'tammjai Cafe',
                style: TextStyle(color: textcolors),
              ),
            ),
            Text(
              "Order Detial",
              style: TextStyle(color: textcolors, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
