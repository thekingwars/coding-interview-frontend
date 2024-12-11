import 'package:coding_interview_frontend/infraestructure/services/geit.dart';
import 'package:coding_interview_frontend/presentation/controllers/orderbook.dart';
import 'package:coding_interview_frontend/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:coding_interview_frontend/config/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<OrderbookController>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
