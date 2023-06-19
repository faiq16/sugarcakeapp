import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:sugarcakeapp/constants.dart';

class Description extends StatelessWidget {
  final String cakeId;
  const Description({Key? key, required this.cakeId, required String description}) : super(key: key);

  Future<String> getDescription() async {
    var url = Uri.http('localhost', '/flutterapi/read_description.php', {'id': cakeId});
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse['description'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getDescription(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          String description = snapshot.data ?? '';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                child: const Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
