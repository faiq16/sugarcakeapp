import 'package:sugarcakeapp/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../../constants.dart';

class SloganAndLoginOptions extends StatelessWidget {
  const SloganAndLoginOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget signInButton () => Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text(
              "Sign in",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const App(),
                ),
              );
            },
          ),
        ),
      ],
    );
    Widget notHaveAccount() => Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
            top: kDefaultPadding / 2,
            right: kDefaultPadding / 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have and account? ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white60,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            )
          ],
        ));
    Widget slogan() => Container(
      margin: const EdgeInsets.only(
        bottom: kDefaultPadding / 2,
      ),
      child: const Text(
        "Good Cake\nDessert Cake *",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: Colors.orange,
        ),
      ),
    );
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          slogan(),
          signInButton(),
          notHaveAccount(),
        ],
      ),
    );
  }
}
