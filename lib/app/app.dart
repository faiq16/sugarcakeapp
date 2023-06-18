import 'package:flutter/material.dart';
import 'package:sugarcakeapp/cart/screen/cart_screen.dart';
import 'package:sugarcakeapp/profile/profile_screen.dart';
import 'package:sugarcakeapp/home/screen/home_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _iconBool = false;
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
    ),
  );

  ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
  );

  int _currentIndex = 0;

  List<BottomNavigationBarItem> items = [];

  @override
  void initState() {
    items = [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: "",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: "",
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cake",
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dark & Light Theme"),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                });
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
            ),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          items: items,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedIconTheme: IconThemeData(
            size: 30,
            color: Colors.grey[800],
          ),
          unselectedIconTheme: const IconThemeData(
            size: 20,
            color: Colors.grey,
          ),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
