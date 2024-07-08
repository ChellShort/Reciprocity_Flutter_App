import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';
import 'package:reciprocity/Widgets/bottom_navigation_bar.dart';
import 'package:reciprocity/Widgets/drawer.dart';
import 'package:reciprocity/Widgets/welcome_section.dart';
import 'package:reciprocity/views/faq.dart';
import 'package:reciprocity/views/guidelines.dart';
import 'package:reciprocity/views/posts.dart';
import 'package:reciprocity/views/what_is_new.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  

  @override
  State<LandingPage> createState() => _LandingPageState();

  
}

class _LandingPageState extends State<LandingPage> {

  int index = 0;

  @override
  Widget build(BuildContext context) {

  List<Widget> myBody = const [
    WelcomeSection(),
    Guidelines(),
    Posts(),
    Faq(),
    WhatsNew(),
  ];

    return Scaffold(
        drawer: DrawerCustom(
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
