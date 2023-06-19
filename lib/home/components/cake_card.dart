import 'package:flutter/material.dart';
import 'package:sugarcakeapp/constants.dart';
import 'package:sugarcakeapp/details/screen/cake_details.dart';

class CakeCard extends StatelessWidget {
  final dynamic cake;
  final int index;

  const CakeCard({Key? key, required this.cake, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = List.generate(10, (index) => "http://localhost/uploads/${index + 1}.jpg");

    Widget like() => Positioned(
          top: 10,
          right: 30,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 15,
              ),
            ),
          ),
        );

    Widget price() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.attach_money,
              color: Colors.yellow,
              size: 15,
            ),
            Text(
              cake["harga"],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );

    Widget cakeImage() => Hero(
          tag: cake,
          child: Image.network(
            imageUrls[index],
            width: 120,
            height: 100,
          ),
        );

    Widget cakeTitle() => SizedBox(
          width: 120,
          child: Text(
            cake["nama_kue"],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        );

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: kDefaultPadding),
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 10),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.23),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CakeDetailsScreen(
                    cake: cake,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cakeImage(),
                cakeTitle(),
                price(),
              ],
            ),
          ),
        ),
        like(),
      ],
    );
  }
}
