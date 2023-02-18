import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/pages/main_page/MainPage.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming',
      theme: ThemeData(),
      home: const MainPage(),
    );
  }
}
