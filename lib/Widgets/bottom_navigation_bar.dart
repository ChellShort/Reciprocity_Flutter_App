import 'package:flutter/material.dart';

class BottomNavigationCustom extends StatelessWidget {
  const BottomNavigationCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Contact us',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.privacy_tip),
          label: 'Privacy and Terms',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fiber_manual_record),
          label: 'How to use it?',
        ),
      ],
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'All rights reserved 2023 Reciprocity S.A',
          ),
        ),
      ],
    );
  }
}
