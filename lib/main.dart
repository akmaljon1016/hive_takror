import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_takror/Inson.dart';
import 'package:hive_takror/SecondScreen.dart';

late Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox("Kontaktlar");
  Hive.registerAdapter(InsonAdapter());
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact"), actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SecondScreen(
                            box: box,
                          )));
            },
            icon: Icon(Icons.add))
      ]),
      body: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, box, child) {
            return ListView.builder(
              itemCount: box.values.length,
                itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text(box.getAt(index).ism),
                  Text(box.getAt(index).tel),
                ],
              );
            });
          }),
    );
  }
}
