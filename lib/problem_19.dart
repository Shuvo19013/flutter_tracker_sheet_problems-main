import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool _isDarkMode = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _toggleDarkMode(bool value) {
    setState(() {
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

class SettingsScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onToggleDarkMode;

  SettingsScreen({required this.isDarkMode, required this.onToggleDarkMode});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
  }

  void _toggleDrawer() {
    if (_drawerController.status == AnimationStatus.completed) {
      _drawerController.reverse();
    } else {
      _drawerController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: _toggleDrawer,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appearance',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.dark_mode, color: Colors.blueAccent),
                    title: Text('Dark Mode', style: TextStyle(fontSize: 18)),
                    trailing: Switch(
                      value: widget.isDarkMode,
                      onChanged: widget.onToggleDarkMode,
                      activeColor: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _drawerController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  -MediaQuery.of(context).size.width *
                      (1 - _drawerController.value),
                  0,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        DrawerHeader(
                          decoration: BoxDecoration(color: Colors.blueAccent),
                          child: Text(
                            'Menu',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text('Home'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
