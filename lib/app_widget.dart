import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/pages/main_page/main_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFF222222),
      ),
      home: const MainPage(),
    );
  }
}
