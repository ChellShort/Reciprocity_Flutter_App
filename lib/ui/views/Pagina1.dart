import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reciprocity/ui/views/Inicio.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({Key? key}) : super(key: key);
  static String id = 'register_view';

  @override
  Widget build(BuildContext context) {
    // Método para redireccionar después de 10 segundos
    void redirectToPage2() {
      Future.delayed(const Duration(seconds: 10), () {
        Navigator.pushReplacementNamed(context, Inicio.id);
      });
    }

    // Llamar al método para iniciar el contador de tiempo
    redirectToPage2();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logoconleyenda.png'),
                    const SizedBox(height: 20),
                    const Text(
                      'Oferta de tiempo limitado',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Image.asset('assets/images/oferta.jpg'),
                  ],
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: FractionalTranslation(
              translation: Offset(0.0, -3.5),
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
