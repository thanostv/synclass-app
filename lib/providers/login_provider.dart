
import 'package:flutter/material.dart';

import 'package:synclass_app/services/auth_service.dart';

class LoginProvider extends ChangeNotifier {

  final formKey = GlobalKey<FormState>();
  final emailTextCtrl = TextEditingController();
  final passwordTextCtrl = TextEditingController();

  final authService = AuthService();

  validateLogin() {
    return formKey.currentState!.validate();
  }

 Future<Map<String, dynamic>> login() async {
    final response = await authService.login(emailTextCtrl.text, passwordTextCtrl.text);

    return response;
  }
}