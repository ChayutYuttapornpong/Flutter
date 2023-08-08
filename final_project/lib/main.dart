import 'package:final_project/screens/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const appbarcolor = Colors.white; // สีส่วนAppdata
const selectbar = Color(0xFFF8F3F3); // สีส่วนเลือกประเภทสินค้า
const backgroundcolor = Color(0xFFFCFAFA); // สีส่วนพื้นหลัง
const buttoncolor = Color(0xFFF6C26F); //
const textcolors = Color(0xFF434343);
void main() {
  runApp(const MyApp());
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
      textTheme: GoogleFonts.itimTextTheme(baseTheme.textTheme).copyWith());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(Brightness.light),
      home: const Scaffold(
        body: SafeArea(
          child: mainpage(),
        ),
      ),
    );
  }
}
