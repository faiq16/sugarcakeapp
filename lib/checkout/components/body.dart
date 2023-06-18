import 'package:sugarcakeapp/checkout/components/payment.dart';
import 'package:sugarcakeapp/constants.dart';
import 'package:flutter/material.dart';

import '../../models/cake.dart';
import 'address.dart';
import 'make_payment.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.cart}) : super(key: key);
  final List<List<Cake>> cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Address(),
        Payment(),
        SizedBox(height: kDefaultPadding * 4),
        MakePayment(),
      ],
    );
  }
}
