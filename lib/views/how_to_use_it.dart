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
                imageUrl: 'assets/images/Screenshot_1722545171.png',
                description:
                    'Para comenzar, ingresa tus credenciales en la pantalla de inicio de sesión. Si no tienes una cuenta, puedes registrarte haciendo clic en el botón "REGISTER"..',
              ),
              HowToUseSection(
                imageUrl: 'assets/images/Screenshot_1722545600.png',
                description:
                    'Despues de iniciar sesión, podras elegir entre los distintos examenes disponibles y seguir las instrucciones para conseguir la mejor puntuación posible. Además podras unirte a una reunión virtual si es que asi lo quieres.',
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
          Container(width: 200, child: Image.asset(imageUrl), decoration: BoxDecoration(border: Border.all(color: Colors.black)),),
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
