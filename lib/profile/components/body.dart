import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:sugarcakeapp/profile/components/profile_menu.dart';
import 'package:sugarcakeapp/profile/components/profile_pic.dart';
=======
import 'profile_pic.dart';
import 'profile_menu.dart';
>>>>>>> 4893dbc933adec76ff00838f77c69c164b033c49

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


