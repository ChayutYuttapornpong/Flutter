import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lesson08/service/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter With Firebase',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Database db = Database();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Data...'),
      ),
      body: Center(
        child: FutureBuilder<String?>(
          future: db.getData(path: '/customers/Xpmm1eKwhawYrivfeRyQ'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.toString());
              return const Text('Data Ready');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
