import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar_inicio.dart';
import 'package:reciprocity/Widgets/bottom_navigation_bar.dart';
import 'package:reciprocity/Widgets/drawer_inicio.dart';
import 'package:reciprocity/views/themes.dart';

class Home extends StatefulWidget {
  final String username;

  const Home({Key? key, required this.username}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> myBody = const [
      Themes(),
    ];

    return Scaffold(
      drawer: DrawerCustomInicio(
        cIndex: (i) {
          setState(() {
            index = i; //Se asigna el valor de n elemento del drawer, para así redibujar el body
          });
        },
        username: widget.username,
      ),
      appBar: const AppBarCustomInicio(),
      body: ListView(
        children: [
          myBody[index],
        ],
      ),
      bottomNavigationBar: const BottomNavigationCustom(),
    );
  }
}
