import 'package:flutter/material.dart';
import 'package:reciprocity/views/contact_us.dart';
import 'package:reciprocity/views/how_to_use_it.dart';
import 'package:reciprocity/views/privacy_and_terms.dart';

class BottomNavigationCustom extends StatelessWidget {
  const BottomNavigationCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactUs(),
                      ),
                    );
                  },
                  child: const Text('Contact us', style: TextStyle(fontFamily: "Cabin", fontWeight: FontWeight.bold))),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyAndTerms(),
                      ),
                    );
                  },
                  child: const Text('Privacy and Terms', style: TextStyle(fontFamily: "Cabin", fontWeight: FontWeight.bold))),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HowToUse(),
                      ),
                    );
                  },
                  child: const Text('How to use it?', style: TextStyle(fontFamily: "Cabin", fontWeight: FontWeight.bold)))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'All rights reserved 2024 TLTI S.A',
              style: TextStyle(fontFamily: "Cabin")
            ),
          ),
        ],
      ),
    );
  }
}
