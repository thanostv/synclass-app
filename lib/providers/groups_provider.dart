
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:synclass_app/models/models.dart';
import 'package:synclass_app/services/services.dart';

class GroupsProvider extends ChangeNotifier {
  List<Group> todaysTeacherGroupList = [];

  final groupsService = GroupsService();

  int selectedDay = DateTime.now().weekday == 1 ? DateTime.now().weekday : DateTime.now().weekday - 1;

  List<Group> myTeacherGroupOriginal = [];
  List<Group> myTeacherGroupFilter = [];

  Future<List<Group>> todaysTeacherGroup() async {
    final Response response = await groupsService.todaysTeacherGroups();

    todaysTeacherGroupList = (response.data as List).map((e) => Group.fromMap(e)).toList();

    return todaysTeacherGroupList;
  }

  Future<List<Group>> myTeacherGroup() async {
    final Response response = await groupsService.myTeacherGroup();

    myTeacherGroupOriginal = (response.data as List).map((e) => Group.fromMap(e)).toList();

    myTeacherGroupFilter = myTeacherGroupOriginal.where((group) => group.days.any((day) => day.id == selectedDay)).toList();
    
    return myTeacherGroupFilter;
  }

  Future<List<Group>> passAttendanceGroup(int groupId, List<int> alumnIds) async {
    final body = {
      'group_id': groupId,
      'alumns': alumnIds
    };

    final Response response = await groupsService.passAttendanceGroup(body);

    final group = Group.fromMap(response.data);

    final index = todaysTeacherGroupList.indexWhere((element) => element.id == group.id);

    todaysTeacherGroupList[index] = group;

    notifyListeners();

    return todaysTeacherGroupList;
  }
}