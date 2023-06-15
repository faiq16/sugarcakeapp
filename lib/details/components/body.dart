import 'package:sugarcakeapp/details/components/image_and_rating.dart';
import 'package:sugarcakeapp/details/components/title_and_amount_controller.dart';
import 'package:flutter/material.dart';

import '../../models/cake.dart';
import 'description.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key, required this.cake,
  }) : super(key: key);
  final Cake cake;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              ImageAndRating(cake: cake,),
               TitleAndAmountController(title: "${cake.name}" ),
                Description(description: "${cake.description}" ),
            ],
          ),
        ),
  );
  }
}
