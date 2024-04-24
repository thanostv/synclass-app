
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:synclass_app/models/models.dart';
import 'package:synclass_app/services/auth_service.dart';
import 'package:synclass_app/services/group_service.dart';

class GroupProvider extends ChangeNotifier {
  final groupformKey = GlobalKey<FormState>();
  final alumnsFormKey = GlobalKey<FormState>();

  final groupNameTextCtrl = TextEditingController();
  late DateTime initialDate;
  late DateTime finalDate;

  final List<int> selectedDays = [];
  final alumnsNumberTextCtrl = TextEditingController();
  
  List<TextEditingController> editingControllerList = [];

  final authService = AuthService();
  final groupService = GroupService();

  late Group group;

  validateGroup() {
    return groupformKey.currentState!.validate();
  }

  validateAlumns() {
    return alumnsFormKey.currentState!.validate();
  }

  Future<Map<String, dynamic>> createGroup() async {
    final User? user = await authService.readUser();

    final alumnsList = editingControllerList.map((e) => {
      'name': e.text
    }).toList();

    final data = {
      'name': groupNameTextCtrl.text,
      'initial_date': DateFormat('yyyy-MM-dd').format(initialDate),
      'final_date': DateFormat('yyyy-MM-dd').format(finalDate),
      'alumns_amount': int.parse(alumnsNumberTextCtrl.text),
      'teacher_id': user!.teacherId,
      'days': selectedDays,
      'alumns': alumnsList,
    };

    final response = await groupService.createGroup(data);

    group = Group.fromMap(response.data['data']['group']);

    return response.data;
  }
}