import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(),
      body: Center(child: Text('How To Use')),
    );
  }
}