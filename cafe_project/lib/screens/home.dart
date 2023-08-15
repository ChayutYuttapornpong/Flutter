import 'package:flutter/material.dart';
import 'package:cafe_project/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 14,
                child: Column(
                  children: [
                    _topMenu(
                        title: 'T a m m J a i  C a f e ',
                        action: _icon(),
                        subtitle: 'Choose Category'),
                    Container()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Widget _topMenu({
  required String title,
  required Widget action,
  required String subtitle,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: textcolors,
              fontSize: 45,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            subtitle,
            style: const TextStyle(
              color: textcolors,
              fontSize: 30,
            ),
          ),
        ],
      ),
      Expanded(flex: 5, child: Container(width: double.infinity)),
      Expanded(flex: 1, child: action)
    ],
  );
}

Widget _icon() {
  return Container(
      width: 20,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selectbar,
      ),
      child: const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.notifications_active,
          color: Colors.white,
        ),
      ));
}
