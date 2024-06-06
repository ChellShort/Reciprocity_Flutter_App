import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';
import 'package:reciprocity/Widgets/bottom_navigation_bar.dart';
import 'package:reciprocity/Widgets/drawer.dart';
import 'package:reciprocity/Widgets/drawer_inicio.dart';
import 'package:reciprocity/Widgets/statistics.dart';
import 'package:reciprocity/Widgets/welcome.dart';
import 'package:reciprocity/Widgets/welcome_section.dart';
import 'package:reciprocity/views/faq.dart';
import 'package:reciprocity/views/guidelines.dart';
import 'package:reciprocity/views/login.dart';
import 'package:reciprocity/views/posts.dart';
import 'package:reciprocity/views/themes.dart';
import 'package:reciprocity/views/what_is_new.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  

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
            index = i; //Se asigna el valor de n elemento del drawer, para asi redibujar el body
          });
        },
        ),
        appBar: const AppBarCustom(),
        body: ListView(
          children: [
            myBody[index],
          ],
        ),
        bottomNavigationBar: const BottomNavigationCustom());
  }
}
