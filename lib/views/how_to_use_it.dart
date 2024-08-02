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
                    'To get started, enter your credentials on the login screen. If you do not have an account, you can register by clicking the "REGISTER" button...',
              ),
              HowToUseSection(
                imageUrl: 'assets/images/Screenshot_1722545600.png',
                description:
                    'After logging in, you will be able to choose between the different exams available and follow the instructions to get the best possible score. You can also join a virtual meeting if you want.',
              ),
              HowToUseSection(
                imageUrl: 'assets/images/im3.jpg',
                description:
                    'The main objective of the application is to improve collaboration between users to practice on each other.',
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
