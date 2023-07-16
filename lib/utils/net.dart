import 'dart:convert';

import 'package:http/http.dart' as http;


dynamic getHtml(Uri url, {required String contentType}) async{
  const headers = {"User-Agent": "Nlight-Flutter"};
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    switch(contentType) {
      case "json":
        return jsonDecode(response.body);
      case "content":
        return response.body;
    }
  }
}
