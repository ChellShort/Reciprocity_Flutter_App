import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(),
      body: Center(child: Text('Forgot Password')),
    );
  }
}