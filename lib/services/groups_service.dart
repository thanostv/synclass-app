
import 'package:dio/dio.dart';

import 'package:synclass_app/configs/configs.dart';
import 'package:synclass_app/services/services.dart';

class GroupsService {
  final authService = AuthService();

  final Dio dio = Dio();

  todaysTeacherGroups() async {
    final token = await authService.readToken();

    final response = await dio.get(
      '$baseUrl/teacher_groups/day_groups',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        },
      )
    );

    return response;
  }

  myTeacherGroup() async {
    final token = await authService.readToken();

    final response = await dio.get(
      '$baseUrl/teacher_groups/my_groups',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        },
      )
    );

    return response;
  }

  passAttendanceGroup(body) async {
    final token = await authService.readToken();

    final response = await dio.post(
      '$baseUrl/teacher_groups/pass_attendance_group',
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