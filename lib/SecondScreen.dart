import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_takror/Inson.dart';
import 'package:hive_takror/main.dart';

class SecondScreen extends StatefulWidget {
  final Box box;

  const SecondScreen({Key? key, required this.box}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController txtism = TextEditingController();
  TextEditingController txtnub = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact qoshish")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtism,
              decoration: InputDecoration(
                  hintText: "Ism",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtnub,
              decoration: InputDecoration(
                  hintText: "Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Inson inson = Inson(
                     txtism.value.text,
                     txtnub.value.text,
                  );
                  box.add(inson);
                  Navigator.pop(context);
                },
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.blue,
                child: Text("Saqlash", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
