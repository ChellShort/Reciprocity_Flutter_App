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
              '\nQ: What is TLTI?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: TLTI is an application designed to facilitate the practice of technical English for STEM students.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: How can I register for TLTI?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: You can register for TLTI by following the registration process created within the application.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: Is TLTI free?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: TLTI is free. In the future, we plan to offer a premium subscription that will unlock additional features such as extended sessions, progress reports, and pronunciation correction.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: What type of content is available on TLTI?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: TLTI includes a database of content related to STEM, allowing users to engage in learning activities such as technical exams in various areas and video calls.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: How does TLTI protect my personal information?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: TLTI implements advanced security measures, including data encryption and strict privacy policies to ensure your personal information is protected.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            const Text(
              '\nQ: Can I access TLTI from different devices?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Fjalla",
              ),
            ),
            const Text(
              'A: For now, TLTI is exclusive to Android devices.',
              style: TextStyle(fontSize: 16, fontFamily: "Cabin",),
            ),
            // Add more questions and answers as needed
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
          // You can add more widgets here if necessary
        ],
      ),
    );
  }
}
