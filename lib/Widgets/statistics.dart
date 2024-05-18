import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 60,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('10 rooms in session'),
                  const Text('150 people online'),
                  const Text('Decide the topic to discuss...'),
                  const Text('What is reciprocity?'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                              '7 min'),
                              Text(
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                                'Session')
                            ],
                          ),
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                              '1:1'),
                              Text(
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                                'Conversation')
                            ],
                          ),
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                              '10+'),
                              Text(
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                                'Universities')
                            ],
                          ),
                      ),
                    ],
                  ),
                  const Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/images/reciprocitylogo.png'))
                ],
              ),
            ),
          );
  }
}