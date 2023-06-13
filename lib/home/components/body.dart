import 'package:sugarcakeapp/home/components/popular_cake.dart';
import 'package:sugarcakeapp/home/components/title_search_bar_and_categories.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TitleSearchBarAndCategories(),
            PopularCake(),
          ],
        )),
      ),
    );
  }
}
