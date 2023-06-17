
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/cake.dart';
import '../../responsive.dart';
import 'cake_card.dart';

class PopularCake extends StatelessWidget {
  const PopularCake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most popular",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.normal,
              ),
        ),
        SizedBox(
          height: 280,
          child: Responsive(
            mobile: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              itemCount: cakes.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => CakeCard(
                cake: cakes[index],
              ),
            ),
            tablet: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              itemCount: cakes.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => CakeCard(
                cake: cakes[index],
              ),
            ),
            desktop: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: cakes
                    .map(
                      (cake) => Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: CakeCard(
                          cake: cake,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
