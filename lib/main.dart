import 'package:flutter/material.dart';
import 'package:reciprocity/pruebas/padre_hijo.dart';
import 'package:reciprocity/views/landing_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LandingPage(),
    );
  }
}
