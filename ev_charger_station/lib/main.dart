import 'package:ev_charger_station/screens/loginscreens.dart';
import 'package:flutter/material.dart';

const backgroundblue = Color(0xFF535FFD);
const backgroundwhite = Color(0xFFFAFAFA);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * .4,
                decoration: const BoxDecoration(
                    color: backgroundblue, borderRadius: BorderRadius.only()),
              ),
              Container(
                decoration: const BoxDecoration(color: backgroundblue),
                child: Container(
                  height: height * .5,
                  decoration: const BoxDecoration(
                      color: backgroundwhite,
                      borderRadius: BorderRadius.only()),
                ),
              ),
              Positioned(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ))
            ],
          ),
          Positioned(
              width: 300,
              height: 450,
              top: height * 0.25 - (width * .1),
              left: width * 0.08,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: login(),
                  )))
        ],
      ),
    );
  }
}
