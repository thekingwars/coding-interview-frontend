import 'package:coding_interview_frontend/infraestructure/services/geit.dart';
import 'package:coding_interview_frontend/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:coding_interview_frontend/config/theme/theme.dart';

void main() {
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
