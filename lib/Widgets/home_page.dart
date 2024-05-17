import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/bottom_navigation_bar.dart';

class HomePageCustom extends StatelessWidget {
  const HomePageCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child:
                  Image(image: AssetImage('assets/images/logoconleyenda.png'))),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Column(
                    children: [
                      Text('Do you want to practice your english?'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                
                              },
                              child: Text('Register')),
                          ElevatedButton(
                            onPressed: null, child: Text('Login')),
                        ],
                      ),
                      Image(image: AssetImage('assets/images/bannerinicio.png'))
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey
                  ),
                  margin: const EdgeInsets.all(10),
                  child: const Column(
                    children: [
                      Text('10 rooms in session'),
                      Text('150 people online'),
                      Text('Decide the topic to discuss...'),
                      Text('What is reciprocity?'),
                      Image(
                        width: 100,
                        height: 100,
                          image: AssetImage('assets/images/reciprocitylogo.png'))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar:
          const BottomNavigationCustom());
  }
}
