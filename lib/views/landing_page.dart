import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';
import 'package:reciprocity/Widgets/bottom_navigation_bar.dart';
import 'package:reciprocity/Widgets/drawer.dart';
import 'package:reciprocity/Widgets/statistics.dart';
import 'package:reciprocity/Widgets/what_is_new.dart';
import 'package:reciprocity/Widgets/welcome.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  

  @override
  State<LandingPage> createState() => _LandingPageState();

  
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerCustom(),
        appBar: const AppBarCustom(),
        body: ListView(
          children: const [
            SizedBox(
              height: 900,
              child: Column(
                children: [
                Welcome(),
                Statistics(),])),
          ],
        ),
        bottomNavigationBar: const BottomNavigationCustom());
  }
}
