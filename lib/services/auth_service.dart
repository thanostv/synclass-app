import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:synclass_app/configs/configs.dart';
import 'package:synclass_app/models/user.dart';

class AuthService {
  // Create storage
  final _storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/login'), body: {
      'email': email,
      'password': password
    });

    final json = jsonDecode(response.body);

    if(response.statusCode == 200) { 
      final user = User.fromMap(json['data']['user']);

      // Guardar en secure storage la información del usuario
      await _storage.write(key: 'token', value: user.token);
      await _storage.write(key: 'user', value: user.toJson());

      return {
        'status': true,
        'data': user
      };
    }

    return json;
  }

  Future<Map<String, dynamic>> logout() async {
    final token = await readToken();

    final response = await http.post(Uri.parse('$baseUrl/logout'), headers: {
      'Authorization': 'Bearer $token'
    });

    await deleteAllSecureStorage();

    if(response.statusCode == 200) {
      return {
        'status': true,
        'message': 'Sesión cerrada correctamente'
      };
    }

    return {
      'status': false,
      'message': 'Error al intentar cerrar sesión'
    };
  }

  Future<String> readToken() async {
    return await _storage.read(key: 'token') ?? '';
  }

  Future<User?> readUser() async {
    String readStorage = await _storage.read(key: 'user') ?? '';

    User? user;
    if(readStorage != '') {
      user = User.fromJson(readStorage);
    }

    return user;
  }

  Future<void> deleteAllSecureStorage() async {
    await _storage.deleteAll();
  }
}