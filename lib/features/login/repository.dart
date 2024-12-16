import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_web_project/features/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = "http://127.0.0.1:8000/login/";

  // Handle login by sending email and password to the server
  Future<User?> handleLoginUser(String email, String password) async {
    final body = {
      'username': email,
      'password': password,
    };

    try {
      final response = await _postRequest('login/', body);

      // Log the response for debugging
      if (kDebugMode) {
        print('Login response: $response');
      }

      // Ensure response is not null and contains the 'status' field
      if (response != null && response['status'] == true) {
        var data = response['data'];

        if (data != null && data['token'] != null) {
          String token = data['token'];

          // Store token in SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);

          // Parse the user information from 'data'
          var authResponse =
              User.fromJson(response); // Use the full response for User parsing

          return authResponse;
        } else {
          if (kDebugMode) {
            print('Token missing in response data');
          }
          return null; // Token not found
        }
      } else {
        if (kDebugMode) {
          print('Login failed: ${response?['message'] ?? 'Unknown error'}');
          return null; // Login failed
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Login error: $e');
      }
      return null; // Handle error
    }
    return null;
  }

  // Send a POST request to the server
  Future<Map<String, dynamic>?> _postRequest(
      String endpoint, Map<String, dynamic> body) async {
    final Uri url = Uri.parse(apiUrl); // Use the apiUrl directly

    try {
      final response = await http.post(
        url,
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );

      // Log the raw response for debugging
      if (kDebugMode) {
        print('Raw response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        // If the request is successful, parse the response
        return json.decode(response.body);
      } else {
        // Log response status and body in case of failure
        if (kDebugMode) {
          print('Response error: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Network error: $e');
      }
      rethrow; // rethrow the error
    }
  }
}
