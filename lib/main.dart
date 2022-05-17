import 'package:flutter/material.dart';
import 'package:travel_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App UI',
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFFD8ECF1)),
      ),
      home: HomeScreen(),
    );
  }
}
