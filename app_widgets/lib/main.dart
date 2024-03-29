import 'package:app_widgets/config/router/app_router.dart';
import 'package:app_widgets/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 1).getTheme(),
    );
  }
}
