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
  bool _isDarkMode = false;

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
      title: "Sugar cake",
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SUGAR CAKE'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
              icon: Icon(
                _isDarkMode ? Icons.brightness_7 : Icons.brightness_4,
              ),
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
            color: Colors.black,
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
