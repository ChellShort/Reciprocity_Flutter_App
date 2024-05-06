import 'package:flutter/material.dart';

class seccion2 extends StatelessWidget {
  const seccion2({super.key});
  static String id = 'seccion2';

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
            Padding(
              padding: const EdgeInsets.all(20.0), // Agregamos un margen de 20 en todos los lados
              child: Text(
                'OBJETIVO\nFacilitar a los estudiantes ‘STEM’ de UPQ la práctica y desenvolvimiento en el idioma inglés de manera accesible y efectiva. Promoviendo la comunicación y el aprendizaje colaborativo.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center, // Centramos el texto
              ),
            ),
            Image.asset(
              'assets/images/objetivo.png', // Ruta de la imagen que quieres mostrar
              height: 200, // Ajusta el tamaño de la imagen según sea necesario
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
