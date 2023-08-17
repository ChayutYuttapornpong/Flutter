import 'package:cafe_project/screens/coffee.dart';
import 'package:flutter/material.dart';
import 'package:cafe_project/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String pageorder = 'coffee';

  _orderView() {
    switch (pageorder) {
      case 'coffee':
        return const coffee();
      case 'Tea':
        return Container();
      case 'Soda':
        return Container();
      case 'Milk':
        return Container();
      default:
        return const coffee();
    }
  }

  _setPage(String order) {
    setState(() {
      pageorder = order;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  _topMenu(
                      title: 'T  a  m  m  J  a  i   C  a  f  e ',
                      action: _icon(),
                      subtitle: 'Choose Category'),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _itemTab(
                            icon: 'TaamJaiCafe/icons/coffee.png',
                            isActive: true,
                            title: 'Coffee'),
                        const SizedBox(
                          width: 20,
                        ),
                        _itemTab(
                            icon: 'TaamJaiCafe/icons/tea.png',
                            isActive: false,
                            title: 'Tea'),
                        const SizedBox(
                          width: 20,
                        ),
                        _itemTab(
                            icon: 'TaamJaiCafe/icons/sparkling-water.png',
                            isActive: false,
                            title: 'Soda'),
                        const SizedBox(
                          width: 20,
                        ),
                        _itemTab(
                            icon: 'TaamJaiCafe/icons/milk.png',
                            isActive: false,
                            title: 'Milk'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Text(
              'Choose Category',
              style: TextStyle(color: textcolors, fontSize: 25),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                child: _orderView(),
              ),
            ),
          ],
        ),
      ),
    );
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
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              subtitle,
              style: const TextStyle(
                color: textcolors,
                fontSize: 24,
              ),
            ),
          ],
        ),
        Expanded(child: Container(width: double.infinity)),
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

  Widget _itemTab(
      {required String icon, required String title, required bool isActive}) {
    return Container(
      width: 100,
      height: 150,
      child: GestureDetector(
        onTap: () => _setPage(icon),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: pageorder == icon ? selectbar : Colors.transparent,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.slowMiddle,
              child: Column(
                children: [
                  Image.asset(
                    icon,
                    width: 30,
                    height: 45,
                    color: textcolors,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(color: textcolors, fontSize: 20),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
