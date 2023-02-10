import 'package:flutter/material.dart';
import 'package:task/presentation/resources/route_manager.dart';

import '../presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      initialRoute: RouteManager.login,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: ThemeManager.appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
