// ignore_for_file: file_names, camel_case_types

import 'package:final_project/main.dart';
import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);
  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            children: [
              Image.asset(
                "TaamJaiCafe/Tea/matcha-green-tea.jpg",
                width: 100,
                height: 100,
              ),
              const Text(
                "Tammjai'Cafe",
                style: TextStyle(fontSize: 40, color: buttoncolor),
              ),
              const SizedBox(
                width: 50,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    hintText: 'Search menu...'),
              )
            ],
          ),
        ));
  }
}
