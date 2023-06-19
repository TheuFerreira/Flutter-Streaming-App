import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';
import 'package:streaming_app/app_widget.dart';
import 'package:streaming_app/core/fetch/fetch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  setContainers();

  runApp(const AppWidget());
}

void setContainers() {
  final injector = Injector.appInstance;

  injector.registerSingleton<Fetch>(() {
    final apiUrl = dotenv.env['API_URL'] as String;
    return FetchImpl(apiUrl);
  });
}
