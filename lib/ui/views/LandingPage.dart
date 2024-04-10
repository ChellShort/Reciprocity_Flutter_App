import 'package:flutter/material.dart';
import 'package:reciprocity/ui/views/Inicio.dart';
import 'package:reciprocity/ui/views/login_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static String id = 'register_view';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.612), // Establece el color de fondo como transparente
        leading: Image.asset(
          'assets/images/reciprocitylogo.png',
          height: 40, // Ajusta la altura según sea necesario
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),

        


        body: Padding(
          padding: EdgeInsets.only(top: 5), // Espacio de separación de 20 unidades entre el AppBar y el Column
          child: Column(
            children: [
              Expanded(
              flex: 2,
              child: Container(
                color: Color.fromRGBO(217, 217, 217, 100), // Segundo color de fondo
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      //Texto de bienvenida
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Do you want to practice your \nenglish?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange, 
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.black,
                            ),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(168, 255, 53, 100)),
                          ),
                          
                        ),
                        SizedBox(width: 10), 
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, LoginView.id);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(168, 255, 53, 100)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'assets/images/bannerinicio.png',
                          height: 500,
                          width: 500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),

              const SizedBox(height: 5),
              

              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                    flex: 3,
                    child: Container(
                      color: Color.fromRGBO(217, 217, 217, 100), // Segundo color de fondo
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                              Text(
                                '10 rooms in session',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, 
                                ),
                              ),
                              Text(
                                '150 people online',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, 
                                ),
                              ),
                              Text(
                                'Learn from real people',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, 
                                ),
                              ),
                              Text(
                                'Decide the topic to discuss ...',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange, 
                                ),
                              ),
                              Text(
                                'What is reciprocity?',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, 
                                ),
                              ),
                          SizedBox(height: 10),
                          Row(
                          //Insertar imagen
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/reciprocitylogo.png',
                              height: 100,
                              width: 100,
                            ),
                          ],
                          ),
                          SizedBox(height: 10),
                        ],
                        
                      ),
                      
                    ),
                    
                    ),
                    Expanded(
                      flex: 1,
                      child: BottomAppBar(
                        color: Color.fromRGBO(217, 217, 217, 100),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Contact us',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Privacy and terms',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'How to use it?',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10), // Espacio entre las filas
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'All rights reserved 2023 Reciprocity S.A.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    
                ],
              ),
              
      ),

      
      ]
      
      
      ),
      )
      
      )
      
    );
    
  }
}