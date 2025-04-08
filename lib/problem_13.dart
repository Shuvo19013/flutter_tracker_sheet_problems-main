import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CustomAppBarScreen(),
    );
  }
}

class CustomAppBarScreen extends StatelessWidget {
  const CustomAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),

              child: Image.network(
                'https://media.istockphoto.com/id/1620926852/photo/white-sneaker-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=CcYj5SYufcuFxUy-l9u1pgDbz62Ty3aD_FaCpqBCaM8=',
                height: 35,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Sneaker\'s',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint('Search pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              debugPrint('Menu pressed');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('This is a custom AppBar!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
