import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  static Future<dynamic> get(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<dynamic> post(String url, Map<String, dynamic> data) async {
    var response = await http.post(Uri.parse(url), body: data);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<dynamic> put(String url, Map<String, dynamic> data) async {
    var response = await http.put(Uri.parse(url), body: data);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<dynamic> delete(String url) async {
    var response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
