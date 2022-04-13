import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  var url = Uri.parse('http://localhost:5000');

  Future getData() async {
    final res = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Accept": "application/json"
    });

    if (res.statusCode == 200) {
      return json.decode(res.body);
    }
  }
}
