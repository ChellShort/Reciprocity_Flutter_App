import 'package:flutter/material.dart';

class seccion1 extends StatelessWidget {
  const seccion1({super.key});
  static String id = 'seccion1';

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
            Expanded(
              child: Image.asset(
                'assets/images/temas.png', // Ruta de la imagen que quieres mostrar
                fit: BoxFit.contain, // Para ajustar la imagen al tamaño del espacio disponible
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
