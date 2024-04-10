import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});
  static String id = 'Inicio';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(

        appBar: AppBar(
        backgroundColor: Colors.transparent, // Establece el color de fondo como transparente
        flexibleSpace: Container(
          decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange, // Color inicial del gradiente
                      Colors.red, // Color final del gradiente
                    ],
                  ),
                ),
          child: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/ReciproCity.jpg',
                height: 80,
              ),
            ],
          ),
        ),
      ),

        body: Center(      
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
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
                  child: Text('SECCIÓN 1', style: TextStyle(fontSize: 25 ,color: Colors.white),),
                ),
              ),

              const SizedBox(height: 20),

              Container(
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
                  child: Text('SECCIÓN 2', style: TextStyle(fontSize: 25 ,color: Colors.white),),
                ),
              ),

              const SizedBox(height: 20),

              Container(
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
                  child: Text('SECCIÓN 3', style: TextStyle(fontSize: 25 ,color: Colors.white),),
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
