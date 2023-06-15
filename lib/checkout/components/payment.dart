import 'package:flutter/material.dart';

import '../../constants.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Payment method",
              style:  TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              )),
          Container(
            margin: const EdgeInsets.only(top: kDefaultPadding / 2),
            width: size.width ,
            height: 50,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: kDefaultPadding),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/payment${index + 1}.jpeg'), // Ubah path relatif sesuai dengan nama file gambar yang diinginkan
                        fit: BoxFit.fitWidth,),
                  ),
                );
                
              },
            ),
          )
        ],
      ),
    );
  }
}
