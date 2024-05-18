import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(),
      body: Center(
        child: Text('Register Page'),
      )
    );
  }
}