import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff522258),
              ),
              child: Center(
                child: const Text(
                  'FAQ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Fjalla",
                  ),
                ),
              ),
            ),
            const Text(
              '\nQ: ¿Qué es TLTI?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: TLTI es una aplicación diseñada para facilitar la práctica del inglés para estudiantes de STEM de la UPQ.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: ¿Cómo puedo registrarme en TLTI?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: Puedes registrarte en TLTI descargando la aplicación desde la tienda de aplicaciones y siguiendo el proceso de registro, que incluye la creación de un perfil',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: ¿Es TLTI gratuita?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: TLTI ofrece una versión gratuita con acceso a funciones básicas. También hay una suscripción premium disponible que desbloquea características adicionales como sesiones extendidas, informes de progreso y corrección de pronunciación.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: ¿Qué tipo de contenido está disponible en TLTI?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: TLTI incluye una base de datos de contenido relacionado con STEM, lo que permite a los usuarios participar en conversaciones y actividades de aprendizaje basadas en temas relevantes para sus estudios y profesión.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: ¿Cómo protege TLTI mi información personal?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: TLTI implementa medidas de seguridad avanzadas, incluyendo encriptación de datos y políticas de privacidad estrictas para asegurar que tu información personal esté protegida.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: ¿Puedo acceder a TLTI desde diferentes dispositivos?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: Sí, TLTI es una plataforma web responsiva, lo que significa que puedes acceder a ella desde computadoras, tablets y smartphones, asegurando una experiencia de usuario óptima en cualquier dispositivo.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ:  ¿TLTI ofrece alguna forma de evaluación de progreso?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: Sí, los usuarios de la versión premium tienen acceso a informes de progreso que evalúan su desempeño en inglés, incluyendo áreas como pronunciación, vocabulario y fluidez.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            // Añade más preguntas y respuestas según sea necesario
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 40,
            child: Faq(),
          ),
          // Puedes agregar más widgets aquí si es necesario
        ],
      ),
    );
  }
}
