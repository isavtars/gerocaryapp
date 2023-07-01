import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screen/Home/home_screen.dart';
import 'constance.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.green,
      systemNavigationBarColor: Colors.green));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: TextButton.styleFrom(
              padding: const EdgeInsets.all(defaultPadding * 0.75),
              shape: const StadiumBorder(),
              backgroundColor: primaryColor,
            ))),
        home: const HomeScreen());
  }
}
