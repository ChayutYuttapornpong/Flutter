// ignore_for_file: file_names, camel_case_types

import 'package:cafe_project/main.dart';
import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);
  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  bool _isSelectedbutton = false;
  bool _isSelectedorderlist = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage:
                      AssetImage("TaamJaiCafe/coffee/Americano.jpg"),
                ),
                const Text(
                  "Tammjai",
                  style: TextStyle(fontSize: 50, color: buttoncolor),
                ),
                const Text(
                  "'Cafe",
                  style: TextStyle(fontSize: 50, color: textcolors),
                ),
                const SizedBox(
                  width: 100,
                ),
                const Padding(padding: EdgeInsets.only(left: 40)),
                ChoiceChip(
                  backgroundColor: Colors.white,
                  selectedColor: Colors.white,
                  avatar: const Icon(Icons.dashboard),
                  label: const Text(
                    "DashBoard",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: _isSelectedbutton ? textcolors : buttoncolor,
                  ),
                  iconTheme: IconThemeData(
                    color: _isSelectedbutton ? textcolors : buttoncolor,
                  ),
                  selected: _isSelectedbutton,
                  onSelected: (newBoolValue) {
                    setState(() {
                      _isSelectedbutton = newBoolValue;
                    });
                  },
                ),
                const SizedBox(
                  width: 80,
                ),
                ChoiceChip(
                  backgroundColor: Colors.white,
                  selectedColor: Colors.white,
                  avatar: const Icon(Icons.calculate),
                  label: const Text(
                    "Orderlist",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: _isSelectedorderlist ? textcolors : buttoncolor,
                  ),
                  iconTheme: IconThemeData(
                    color: _isSelectedorderlist ? textcolors : buttoncolor,
                  ),
                  selected: _isSelectedorderlist,
                  onSelected: (newBoolValue) {
                    setState(() {
                      _isSelectedorderlist = newBoolValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
