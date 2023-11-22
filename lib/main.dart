import 'package:flutter/material.dart';
import 'package:productive_new_version/constants/app_theme.dart';
import 'package:productive_new_version/core/routes/app_routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      onGenerateRoute: AppRouter.router,
    );
  }
}
