import 'package:ecorecycle/screen/LoginPage.dart';
import 'package:ecorecycle/screen/Splash.dart';
import 'package:flutter/material.dart';
import 'package:ecorecycle/core/theme/color_schemes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      routes: {
        '/': (context) =>  LoginPage(),
        '/homepage': (context) => const Splash(),
        //'/registerpage': (context) => RegisterPage(),
      },
    );
  }
}

