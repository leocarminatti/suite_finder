import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/go_now/go_now.dart';

void main() {
  Injector.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeDataApp.lightTheme,
      home: GoNowPage(),
    );
  }
}
