import 'package:flutter/material.dart';

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
                color: Color.fromARGB(255,140, 48, 97)
              ),
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Increase your chances to be hired', style: TextStyle(fontFamily: "Fjalla", fontSize: 20, color: Colors.white)),
                  const Text('Anytime, anywhere', style: TextStyle(fontFamily: "Fjalla", fontSize: 20, color: Colors.white)),
                  const Text('Develop your technical Skills', style: TextStyle(fontFamily: "Fjalla", fontSize: 20, color: Colors.white)),
                  const Text('WHAT IS TLTI?', style: TextStyle(fontFamily: "Fjalla", fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 25,
                                fontFamily: "Fjalla",
                                fontWeight: FontWeight.bold),
                              '7 min'),
                              Text(
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 20,
                                  fontFamily: "Fjalla",
                                  fontWeight: FontWeight.bold),
                                'Tests')
                            ],
                          ),
                      ),
                      Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 25,
                                fontFamily: "Fjalla",
                                fontWeight: FontWeight.bold),
                              'Virtual'),
                              Text(
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 20,
                                  fontFamily: "Fjalla",
                                  fontWeight: FontWeight.bold),
                                'Think tank')
                            ],
                          ),
                      ),
                      Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 25,
                                fontFamily: "Fjalla",
                                fontWeight: FontWeight.bold),
                              '7+ Skills'),
                              Text(
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 20,
                                  fontFamily: "Fjalla",
                                  fontWeight: FontWeight.bold),
                                'Quizzes')
                            ],
                          ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                          width: 100,
                          height: 100,
                          image: AssetImage('assets/images/reciprocitylogo.png')),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}