import 'package:flutter/material.dart';
import 'package:sugarcakeapp/profile/components/profile_menu.dart';
import 'package:sugarcakeapp/profile/components/profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 30),
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


