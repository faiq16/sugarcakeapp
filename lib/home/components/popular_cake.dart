import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/cake.dart';
import '../../responsive.dart';
import 'cake_card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PopularCake extends StatelessWidget {
  const PopularCake({Key? key}) : super(key: key);

  Future<List<dynamic>> getData() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.http('localhost', '/flutterapi/crudflutter/read.php');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
    return jsonResponse;
  }

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
              child: FutureBuilder<Object>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      List<dynamic> data = snapshot.data as List<dynamic>;
                      return Row(
                        children: data
                            .map(
                              (cake) => Padding(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                child: CakeCard(
                                  cake: cake,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }

                    return Text("loading...");
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
