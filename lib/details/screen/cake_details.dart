import 'package:sugarcakeapp/details/components/add_to_cart.dart';
import 'package:flutter/material.dart';

import '../../models/cake.dart';
import '../components/body.dart';

class CakeDetailsScreen extends StatelessWidget {
  const CakeDetailsScreen({Key? key, required this.cake}) : super(key: key);
  final Cake cake;
  @override
  Widget build(BuildContext context) {
    AppBar buildAppBar() => AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text("Details",
          style:  TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.normal,
          )),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
    return Scaffold(
      appBar: buildAppBar(),
      body:  Body(cake: cake,),
      bottomNavigationBar: const AddToCart(),
    );
  }


}


