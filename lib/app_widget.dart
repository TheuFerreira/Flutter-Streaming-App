import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/pages/login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Films',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFF222222),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF967BE3),
          secondary: const Color(0xFF484848),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 12,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
