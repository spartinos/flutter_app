import 'package:flutter/material.dart';
import 'screens/category_selection_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Οικονομική Πλατφόρμα',
      theme: appTheme,
      home: CategorySelectionScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => _getScreen(settings),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    );
  }

  Widget _getScreen(RouteSettings settings) {
    return CategorySelectionScreen();
  }
}
