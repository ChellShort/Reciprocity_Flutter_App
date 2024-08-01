import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.email),
                    SizedBox(width: 10),
                    Text('contact@example.com'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(Icons.phone),
                    SizedBox(width: 10),
                    Text('+1 234 567 890'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(Icons.location_on),
                    SizedBox(width: 10),
                    Text('123 Main Street, City, Country'),
                  ],
                ),
              ],
            ),
          ),),
    ));
  }
}