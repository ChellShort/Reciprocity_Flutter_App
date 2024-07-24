import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar_inicio.dart';
import 'package:reciprocity/Widgets/bottom_navigation_bar.dart';
import 'package:reciprocity/Widgets/drawer_inicio.dart';
import 'package:reciprocity/views/tests.dart';
import 'package:reciprocity/views/test_selector.dart';
import 'package:reciprocity/views/video_meetings.dart';

class Home extends StatefulWidget {
  final String username;
  final String? level;
  const Home({Key? key, required this.username, required this.level}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> myBody = [
      const TestSelector(),
      const VideoMeetings(),
    ];

    return Scaffold(
      drawer: DrawerCustomInicio(
        cIndex: (i) {
          setState(() {
            index = i; //Se asigna el valor de n elemento del drawer, para así redibujar el body
          });
        },
        username: widget.username,
        level: widget.level,
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
