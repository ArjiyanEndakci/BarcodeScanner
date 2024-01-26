import 'package:flutter/material.dart';
import 'package:vekotekbarkod/screens/login.dart';

// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously, unnecessary_null_comparison
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Login(),
        ),
      ),
    );
  }
}
