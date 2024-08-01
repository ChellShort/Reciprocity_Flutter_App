import 'package:flutter/material.dart';
import 'package:reciprocity/views/login.dart';
import 'package:reciprocity/views/register.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 40,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 82, 34, 88),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Do you want to practice your English?',
              style: TextStyle(fontFamily: "Fjalla", fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
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
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 217, 95, 89))),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(fontFamily: "Cabin", color: Colors.white),
                    ),),
                    
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 217, 95, 89))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text('LOGIN', style: TextStyle(fontFamily: "Cabin", color: Colors.white), )),
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
