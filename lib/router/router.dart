import 'package:flutter/material.dart';

import 'package:synclass_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'register': (context) => const RegisterScreen(),
  'section': (context) => const SectionScreen(),
  'magic-code': (context) => const MagicCodeScreen(),
  'dashboard': (context) => const DashboardScreen(),
};