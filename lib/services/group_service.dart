import 'package:dio/dio.dart';

import 'package:synclass_app/configs/configs.dart';
import 'package:synclass_app/services/auth_service.dart';

class GroupService {
  final authService = AuthService();

  final Dio dio = Dio();

  Future<Response> createGroup(body) async {
    final token = await authService.readToken();

    final response = await dio.post(
      '$baseUrl/groups',
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        },
      )
    );

    return response;
  }
}