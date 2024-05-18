import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reciprocity/Widgets/app_bar_inicio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomInicio(),
      body: ListView(
        children: const [
          Center(child: Text('Inicio')),
        ],
      )
    );
  }
}