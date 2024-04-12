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
