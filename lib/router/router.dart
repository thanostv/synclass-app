import 'package:flutter/material.dart';

import 'package:synclass_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'register': (_) => const RegisterScreen()
};