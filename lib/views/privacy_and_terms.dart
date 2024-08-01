import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy Policy',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Introduction\n'
                  'Welcome to Our App! Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our mobile application. Please read this privacy policy carefully. If you do not agree with the terms of this privacy policy, please do not access the application.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Information Collection\n'
                  'We may collect information about you in a variety of ways. The information we may collect via the application includes:\n'
                  '- Personal Data: Demographic and other personally identifiable information (such as your name and email address) that you voluntarily give to us when choosing to participate in various activities related to the application.\n'
                  '- Derivative Data: Information our servers automatically collect when you access the application, such as your native actions that are integral to the application, including liking, re-blogging, or replying to a post, as well as other interactions with the application and other users via server log files.\n',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Terms and Conditions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Introduction\n'
                  'These Terms and Conditions govern your use of our app. By using our app, you accept these Terms and Conditions in full. If you disagree with these Terms and Conditions or any part of these Terms and Conditions, you must not use our app.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'License to Use App\n'
                  'Unless otherwise stated, we or our licensors own the intellectual property rights in the app and material on the app. Subject to the license below, all these intellectual property rights are reserved.\n'
                  'You may view, download for caching purposes only, and print pages from the app for your own personal use, subject to the restrictions set out below and elsewhere in these terms and conditions.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Acceptable Use\n'
                  'You must not use our app in any way that causes, or may cause, damage to the app or impairment of the availability or accessibility of the app; or in any way which is unlawful, illegal, fraudulent or harmful, or in connection with any unlawful, illegal, fraudulent or harmful purpose or activity.\n',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Image(
                    height: 200,
                    image: AssetImage('assets/images/bannerinicio.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
