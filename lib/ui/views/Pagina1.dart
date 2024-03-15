import 'dart:async';
import 'package:flutter/material.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});
  static String id = 'register_view';

  @override
  Widget build(BuildContext context) {
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
                    Image.asset('assets/images/ReciproCity.jpg'),
                    SizedBox(height: 20),
                    Text(
                      'Oferta de tiempo limitado',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Image.asset('assets/images/oferta.jpg'),
                  ],
                ),
              ),
            ],
          ),
          Align(
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
