import 'package:flutter/material.dart';
import 'package:loja_app/screens/home_screen.dart';
import 'package:loja_app/screens/login_screen.dart';
import 'package:loja_app/screens/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 100, 4, 100)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

