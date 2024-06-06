import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/statistics.dart';
import 'package:reciprocity/Widgets/welcome.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
              height: 900,
              child: Column(
                children: [
                Welcome(),
                Statistics(),]));
  }
}