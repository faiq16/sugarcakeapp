import 'package:flutter/material.dart';
import 'profile_pic.dart';

import 'profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icon/User Icon.svg",
          text: "My Account",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icon/Bell.svg",
          text: "Notifications",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icon/Question mark.svg",
          text: "Settings",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icon/User Icon.svg",
          text: "Help Center",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icon/Log out.svg",
          text: "Log Out",
          press: () {},
        ),
      ],
    );
  }
}


