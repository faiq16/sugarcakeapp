import 'package:flutter/material.dart';

import '../../constants.dart';
import '../components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _iconBool = false;
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amberAccent,
    ),
  );

  ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
  );

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SugarCake',
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sugar Cake"),
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
        body: const Body(),
      ),
    );
  }


  AppBar buildAppBar() {
    Widget profileImage() => Container(
          margin: const EdgeInsets.only(
            right: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        );
    Widget settingsButton() => Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: IconButton(
        icon: const Icon(Icons.settings,
            color: Colors.black, size: 20),
        onPressed: () {},
      ),
    );

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: settingsButton(),
      actions: [profileImage()],

    );
  }
}

