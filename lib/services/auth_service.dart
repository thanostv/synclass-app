import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:synclass_app/models/user.dart';

class AuthService {

  final Uri baseUrl = Uri.http('192.168.0.16', 'synclass/api/login');

  login(String email, String password) async {
    final response = await http.post(baseUrl, body: {
      'email': email,
      'password': password
    });

    final json = jsonDecode(response.body);

    if(response.statusCode == 200) { 
      final user = User.fromMap(json['data']['user']);

      return {
        'status': true,
        'data': user
      };
    }

    return json;
  }
}