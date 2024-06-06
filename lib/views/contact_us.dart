import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(),
      body: Center(child: Text('Contact Us')),
    );
  }
}