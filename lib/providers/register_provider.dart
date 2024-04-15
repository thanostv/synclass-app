
import 'package:flutter/material.dart';

import 'package:synclass_app/services/services.dart';

class RegisterProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  // Campos
  final nameTextCtrl      = TextEditingController();
  final emailTextCtrl     = TextEditingController();
  final passwordTextCtrl  = TextEditingController();
  int? rol;
  bool conditions         = false;

  // Servicio
  final registerService = RegisterService();

  validateRegister() {
    formKey.currentState!.save();

    return formKey.currentState!.validate();
  }

  Future<Map<String, dynamic>> register() async {
    final response = await registerService.register({
      'name': nameTextCtrl.text,
      'email': emailTextCtrl.text,
      'password': passwordTextCtrl.text,
      'role_id': rol.toString(),
    });

    return response;
  }
}