import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({super.key});

  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: const Center(child: Text('What is new?')));
  }
}