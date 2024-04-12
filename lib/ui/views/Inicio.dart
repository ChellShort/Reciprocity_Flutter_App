import 'package:flutter/material.dart';
import 'package:reciprocity/ui/views/seccion1.dart';
import 'package:reciprocity/ui/views/seccion2.dart';
import 'package:reciprocity/ui/views/seccion3.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});
  static String id = 'Inicio';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.red,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0), // Ajusta el padding según tu preferencia
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0), // Ajusta el padding según tu preferencia
                    child: Image.asset(
                      'assets/images/logoconleyendayblanco.png',
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => seccion1(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.red,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 150,
                  child: const Center(
                    child: Text(
                      'TEMAS',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => seccion2(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.red,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 150,
                  child: const Center(
                    child: Text(
                      'SOBRE NOSOTROS',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => seccion3(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.red,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 150,
                  child: const Center(
                    child: Text(
                      'METAS A FUTURO',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          child: SizedBox(
            height: 50.0,
            child: Center(
              child: Text('@Derechos Reservados 2024'),
            ),
          ),
        ),
      ),
    );
  }
}
