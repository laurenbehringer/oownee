import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  void pushScreen(Widget screen) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void pushNamedScreen(String screen) {
    Navigator.pushNamed(this, screen);
  }
}
