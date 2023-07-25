import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? scanresult;
  bool checkLineURL = false;
  bool checkFacebookURL = false;
  bool checkYoutubeURL = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QrCode"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // ignore: avoid_unnecessary_containers
        child: Container(
            child: SizedBox(
          height: 300,
          width: double.infinity,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "ผลการสเเกน",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  scanresult ??= "ยังไม่มีข้อมูล",
                  style: const TextStyle(fontSize: 25),
                ),
                const Spacer(),
                checkLineURL
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (await canLaunch(scanresult!)) {
                              await launch(scanresult!);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[900]),
                          child: const Text("ติดตามผ่าน Line",
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    : Container(),
                const Spacer(),
                checkFacebookURL
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            // ignore: deprecated_member_use
                            if (await canLaunch(scanresult!)) {
                              // ignore: deprecated_member_use
                              await launch(scanresult!);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900]),
                          child: const Text("ติดตามผ่าน Facebook",
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    : Container(),
                const Spacer(),
                checkYoutubeURL
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            // ignore: deprecated_member_use
                            if (await canLaunch(scanresult!)) {
                              // ignore: deprecated_member_use
                              await launch(scanresult!);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[900]),
                          child: const Text("ติดตามผ่าน Youtube",
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
        child: const Icon(Icons.qr_code_scanner_sharp),
      ),
    );
  }

  startScan() async {
    String? cameraScanResult = await scanner.scan();
    setState(() {
      scanresult = cameraScanResult!;
    });
    if (scanresult!.contains("line.me")) {
      checkLineURL = true;
    } else if (scanresult!.contains("facebook.com")) {
      checkFacebookURL = true;
    } else if (scanresult!.contains("youtube.com")) {
      checkYoutubeURL = true;
    }
  }
}
