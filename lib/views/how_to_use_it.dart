import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How To Use',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              HowToUseSection(
                imageUrl: 'assets/images/im1.jpg',
                description:
                    'Para comenzar, ingresa tus credenciales en la pantalla de inicio de sesión. Si no tienes una cuenta, puedes registrarte haciendo clic en el botón "Registrarse"..',
              ),
              HowToUseSection(
                imageUrl: 'assets/images/im2.jpg',
                description:
                    'Después de iniciar sesión, puedes emparejar tu cuenta con otros usuarios utilizando la función de emparejamiento. Simplemente selecciona el usuario con el que deseas emparejarte y sigue las instrucciones en pantalla..',
              ),
              HowToUseSection(
                imageUrl: 'assets/images/im3.jpg',
                description:
                    'El objetivo principal de la aplicación es mejorar la colaboración entre usuarios para practicar mutuamente.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HowToUseSection extends StatelessWidget {
  final String imageUrl;
  final String description;

  const HowToUseSection({
    Key? key,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Container(width: 200, child: Image.asset(imageUrl)),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
