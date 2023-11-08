import 'package:flutter/material.dart';
import 'package:forms_app/config/router/app_router.dart';
import 'package:forms_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
//aqui agrego al materialApp.router para que sirva las rutas
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
     
    );
  }
}
