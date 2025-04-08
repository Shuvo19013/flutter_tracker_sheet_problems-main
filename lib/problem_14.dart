import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SwipeListExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SwipeListExample extends StatelessWidget {
  const SwipeListExample({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10, (i) => "Item ${i + 1}");

    return Scaffold(
      appBar: AppBar(title: const Text('Swipe'), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Edit ${items[index]}')),
                    );
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (context) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Delete ${items[index]}')),
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: ListTile(
              title: Text(items[index]),
              tileColor: Colors.grey[100],
            ),
          );
        },
      ),
    );
  }
}
