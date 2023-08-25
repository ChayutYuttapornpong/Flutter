import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class coffee extends StatefulWidget {
  const coffee({super.key});

  @override
  State<coffee> createState() => _coffeeState();
}

class _coffeeState extends State<coffee> {
  var collection = FirebaseFirestore.instance.collection("Coffee");
  late List<Map<String, dynamic>> items;
  bool isloaded = false;

  _incrementCounter() async {
    late List<Map<String, dynamic>> orderList = [];
    var data = await collection.get();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
