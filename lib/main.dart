import 'package:flutter/material.dart';
import 'package:quitgamble/ChatPage.dart';
import 'package:quitgamble/HomeScreen.dart';
import 'package:quitgamble/PatientListPage.dart';
import 'package:quitgamble/SettingsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor _primaryColor = Colors.teal;
  ThemeMode _themeMode = ThemeMode.system;

  void _changeColor(MaterialColor color) {
    setState(() {
      _primaryColor = color;
    });
  }

  void _changeThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      primarySwatch: _primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 14, 32, 9),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: Color.fromARGB(255, 17, 63, 49),
        unselectedItemColor: Color.fromARGB(123, 7, 65, 47),
      ),
      useMaterial3: true,
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: _primaryColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuitGamble',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: _themeMode,
      home: MyHomePage(
        title: 'Quit Gamble',
        onColorChange: _changeColor,
        currentColor: _primaryColor,
        onThemeModeChange: _changeThemeMode,
        currentThemeMode: _themeMode,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.onColorChange,
    required this.currentColor,
    required this.onThemeModeChange,
    required this.currentThemeMode,
  });

  final String title;
  final Function(MaterialColor) onColorChange;
  final MaterialColor currentColor;
  final Function(ThemeMode) onThemeModeChange;
  final ThemeMode currentThemeMode;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const PatientListPage(),
      const ChatListScreen(),
      SettingsPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.credit_card_off_rounded, color: Colors.white),
            const SizedBox(width: 10),
            Text(widget.title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pessoas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}