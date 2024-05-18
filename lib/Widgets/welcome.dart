import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/statistics.dart';
import 'package:reciprocity/views/login.dart';
import 'package:reciprocity/views/register.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return
        Expanded(
          flex: 40,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Do you want to practice your english?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                        child: const Text('Register')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text('Login')),
                  ],
                ),
                const Image(
                    height: 200,
                    image: AssetImage('assets/images/bannerinicio.png'))
              ],
            ),
          ),
        );
  }
}
