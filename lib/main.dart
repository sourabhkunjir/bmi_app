import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_app/homepage.dart';

void main() {
  runApp(ProviderScope(child: BMIApplication()));
}

class BMIApplication extends StatelessWidget {
  const BMIApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
