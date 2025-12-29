import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_endpoints.dart';

class ApiClient {

  static Future<http.Response> post(
      String endpoint,
      Map<String, dynamic> body, {
        String? token,
      }) async {

    final uri = Uri.parse(ApiEndpoints.baseUrl + endpoint);

    return await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> get(
      String endpoint, {
        String? token,
      }) async {

    final uri = Uri.parse(ApiEndpoints.baseUrl + endpoint);

    return await http.get(
      uri,
      headers: {
        if (token != null) "Authorization": "Bearer $token",
      },
    );
  }
}
