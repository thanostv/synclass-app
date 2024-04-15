
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:synclass_app/configs/configs.dart';
import 'package:synclass_app/models/models.dart';

class RegisterService {
  // Create storage
  final _storage = const FlutterSecureStorage();

  register(Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse('$baseUrl/users'), body: body);

    final json = jsonDecode(response.body);

    if(response.statusCode == 200) {
      final User user = User.fromMap(json['data']['user']);

      // Guardar en secure storage la información del usuario
      await _storage.write(key: 'token', value: user.token);
      await _storage.write(key: 'user', value: user.toJson());

      return {
        'status': true,
        'data': user
      };
    }

    return {
      'status': false,
      'message': json['message']
    };
  }
}