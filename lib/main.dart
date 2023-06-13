import 'package:sugarcakeapp/constants.dart';
import 'package:sugarcakeapp/sign_in/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    applyOverlay();

    return const MaterialApp(
      home:  SignIn(),
    );
  }
}
