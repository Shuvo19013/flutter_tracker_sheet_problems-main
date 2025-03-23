import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TextStyleScreen(),
    );
  }
}

class TextStyleScreen extends StatelessWidget {
  const TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Styles"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bold Text",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              "Italic Text",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.green),
            ),
            Text(
              "Underlined Text",
              style: TextStyle(fontSize: 25, decoration: TextDecoration.underline, color: Colors.purple),
            ),
            Text(
              "Strikethrough Text",
              style: TextStyle(fontSize: 28, decoration: TextDecoration.lineThrough, color: Colors.orange),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Large Text",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                SizedBox(width: 10),
                Text(
                  "Small Text",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.brown),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}