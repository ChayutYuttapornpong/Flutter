import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const backgroundcolor = Color(0xFFF3F0E7); // สีส่วนพื้นหลัง
const selectbar = Color(0xFFA89C6C); // สีส่วนเลือกประเภทสินค้า
const cardcolor = Color(0xFFDADEDD); //
const textcolors = Color(0xFF2D4358);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS Food',
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String pageActive = 'Home';

  _pageView() {
    switch (pageActive) {
      case 'Home':
        return MainPage();
      case 'Dashboard':
        return Container();
      case 'History':
        return Container();
      case 'Promos':
        return Container();
      case 'Settings':
        return Container();

      default:
        return MainPage();
    }
  }

  _setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textcolors,
      body: Column(
        children: [
          Container(
            width: 90,
            padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
            height: MediaQuery.of(context).size.height,
            child: _sideMenu(),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24, right: 12),
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: backgroundcolor,
              ),
              child: _pageView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return Column(children: [
      const Padding(padding: EdgeInsets.only(top: 20)),
      _logo(),
      const SizedBox(height: 10),
      Expanded(
        child: ListView(
          children: [
            _itemMenu(
              menu: 'Home',
              icon: Icons.home,
            ),
            _itemMenu(
              menu: 'Dashboard',
              icon: Icons.dashboard,
            ),
            _itemMenu(
              menu: 'Order',
              icon: Icons.format_list_bulleted_rounded,
            ),
            _itemMenu(
              menu: 'Product',
              icon: Icons.discount_outlined,
            ),
            _itemMenu(
              menu: 'Notifications',
              icon: Icons.notifications,
            ),
            const SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _logo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            'TaamJaiCafe/coffee/logo.png',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _itemMenu({required String menu, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () => _setPage(menu),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: pageActive == menu ? selectbar : Colors.transparent,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.slowMiddle,
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
