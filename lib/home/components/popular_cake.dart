import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive.dart';
import 'cake_card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PopularCake extends StatelessWidget {
  const PopularCake({Key? key}) : super(key: key);

  Future<List<dynamic>> getData() async {
    var url = Uri.http('localhost', '/flutterapi/read.php');
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
            mobile: FutureBuilder<List<dynamic>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  List<dynamic> cakes = snapshot.data ?? [];
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    itemCount: cakes.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => CakeCard(
                      cake: cakes[index],
                      index: index, // Pass the index to CakeCard
                    ),
                  );
                }
              },
            ),
            tablet: FutureBuilder<List<dynamic>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  List<dynamic> cakes = snapshot.data ?? [];
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    itemCount: cakes.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => CakeCard(
                      cake: cakes[index],
                      index: index, // Pass the index to CakeCard
                    ),
                  );
                }
              },
            ),
            desktop: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<dynamic>>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    List<dynamic> cakes = snapshot.data ?? [];
                    return Row(
                      children: cakes
                          .map(
                            (cake) => Padding(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              child: CakeCard(
                                cake: cake,
                                index: cakes.indexOf(cake), // Pass the index to CakeCard
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
