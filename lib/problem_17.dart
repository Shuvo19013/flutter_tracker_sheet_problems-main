import 'package:flutter/material.dart';
 import 'dart:math';
 
 void main() {
   runApp(MyApp());
 }
 
 class MyApp extends StatelessWidget {
 class MyApp extends StatefulWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Interactive Animated Box',
       theme: ThemeData(
         brightness: Brightness.dark,
         primarySwatch: Colors.purple,
       ),
       home: AnimatedContainerScreen(),
     );
   }
   _MyAppState createState() => _MyAppState();
 }
 
 class AnimatedContainerScreen extends StatefulWidget {
   @override
   _AnimatedContainerScreenState createState() =>
       _AnimatedContainerScreenState();
 }
 class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
   bool _isDarkMode = false;
   late AnimationController _controller;
 
 class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
   double _width = 120;
   double _height = 120;
   Color _color = Colors.deepPurpleAccent;
   double _borderRadius = 20;
   @override
   void initState() {
     super.initState();
     _controller = AnimationController(
       duration: Duration(milliseconds: 500),
       vsync: this,
     );
   }
 
   void _changeContainer() {
   void _toggleDarkMode(bool value) {
     setState(() {
       final random = Random();
 
       _width = random.nextDouble() * 200 + 120; // Range: 120-320
       _height = random.nextDouble() * 200 + 120;
       _color = Color.fromRGBO(
         random.nextInt(256),
         random.nextInt(256),
         random.nextInt(256),
         1,
       );
       _borderRadius = random.nextDouble() * 100; // Random border radius
       _isDarkMode = value;
       _isDarkMode ? _controller.forward() : _controller.reverse();
     });
   }
 
   @override
   Widget build(BuildContext context) {
     return AnimatedBuilder(
       animation: _controller,
       builder: (context, child) {
         return MaterialApp(
           title: 'Settings Screen',
           theme: ThemeData(
             brightness: _isDarkMode ? Brightness.dark : Brightness.light,
             primarySwatch: Colors.blue,
             useMaterial3: true,
           ),
           home: SettingsScreen(
             isDarkMode: _isDarkMode,
             onToggleDarkMode: _toggleDarkMode,
           ),
         );
       },
     );
   }
 }
 
 class SettingsScreen extends StatelessWidget {
   final bool isDarkMode;
   final Function(bool) onToggleDarkMode;
 
   SettingsScreen({required this.isDarkMode, required this.onToggleDarkMode});
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black87,
       appBar: AppBar(
         title: Text(
           'Interactive Animated Box',
           style: TextStyle(fontWeight: FontWeight.bold),
         ),
         centerTitle: true,
         elevation: 5,
         backgroundColor: Colors.deepPurple,
         title: Text('Settings'),
         backgroundColor: Colors.blueAccent,
       ),
       body: Center(
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             AnimatedContainer(
               duration: Duration(milliseconds: 600),
               curve: Curves.easeInOutCubic,
               width: _width,
               height: _height,
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   colors: [_color, Colors.white.withOpacity(0.4)],
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                 ),
                 boxShadow: [
                   BoxShadow(
                     color: _color.withOpacity(0.6),
                     blurRadius: 20,
                     spreadRadius: 5,
                     offset: Offset(5, 10),
                   )
                 ],
                 borderRadius: BorderRadius.circular(_borderRadius),
               ),
             Text(
               'Appearance',
               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
             ),
             SizedBox(height: 40),
             ElevatedButton(
               onPressed: _changeContainer,
               child: Text(
                 'Transform',
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   letterSpacing: 1.2,
             SizedBox(height: 10),
             Card(
               elevation: 4,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
               child: ListTile(
                 leading: Icon(Icons.dark_mode, color: Colors.blueAccent),
                 title: Text('Dark Mode', style: TextStyle(fontSize: 18)),
                 trailing: Switch(
                   value: isDarkMode,
                   onChanged: onToggleDarkMode,
                   activeColor: Colors.blueAccent,
                 ),
               ),
               style: ElevatedButton.styleFrom(
                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15)),
                 backgroundColor: Colors.purpleAccent,
                 foregroundColor: Colors.white,
                 elevation: 10,
                 shadowColor: Colors.purple,
               ),
             ),
           ],
         ),
       ),
     );
   }
 }