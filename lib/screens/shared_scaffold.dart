import 'package:flutter/material.dart';
import 'package:proj/theme/app_theme.dart';

class SharedScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool showAppBar;

  const SharedScaffold({
    required this.child,
    this.title,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = Theme.of(
      context,
    ).extension<CustomColors>()!.backgroundGradient;

    return Scaffold(
      appBar: showAppBar && title != null
          ? AppBar(
              title: Text(title!),
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: gradient),
              ),
            )
          : null,
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: child,
      ),
    );
  }
}
