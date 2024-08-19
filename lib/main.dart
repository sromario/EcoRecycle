import 'package:ecorecycle/screen/LoginPage.dart';
import 'package:ecorecycle/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:ecorecycle/core/theme/color_schemes.dart';
import 'package:ecorecycle/screen/RegisterPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
        '/homepage':(context) => const HomePage(),
        '/': (context) =>  LoginPage(),
        '/registerpage': (context) => RegisterPage(),
        
             
      },
    );
  }
}

