import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(),
      body: Center(child: Text('Privacy And Terms')),
    );
  }
}