import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kosan_apps/models/spaces.dart';

class SpacesProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var result = await http.get(
      Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'),
    );
    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Spaces> spaces = data.map((item) => Spaces.fromJson(item)).toList();
      return spaces;
    } else {
      return <Spaces>[];
    }
  }
}
