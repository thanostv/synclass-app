import 'package:flutter/material.dart';

import 'package:synclass_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'register': (context) => const RegisterScreen(),
  'section': (context) => const SectionScreen(),
  'magic-code': (context) => const MagicCodeScreen(),
  'magic-code-teacher': (context) => const MagicCodeTeacherScreen(),
  'dashboard': (context) => const DashboardScreen(),
  'group': (context) => const GroupScreen(),
  'alumns': (context) => const AlumnsScreen(),
};