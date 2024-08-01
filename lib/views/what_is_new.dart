import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({super.key});

  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: 
      Column(
              children: [
                Container(decoration: BoxDecoration(color: Colors.black) ,child: const Text('What is new?', style: TextStyle(fontFamily: "Fjalla", fontSize: 20, fontWeight: FontWeight.bold))),
                const Text('Se crearon nuevas interfaces para ayudar a los usuarios a encontrar las funciones de forma más rapida.', style: TextStyle(fontFamily: "Cabin", fontSize: 20)),
                Row(
                  children: [
                    Container(decoration: BoxDecoration(color: Colors.black, border: Border.all()), child:Image.asset("assets/images/im1.jpg", width: 175,height: 400,)),
                    Container(decoration: BoxDecoration(color: Colors.black, border: Border.all()), child: Image.asset("assets/images/Screenshot_1722545171.png", width: 175, height: 400,)),
                  ],
                ),
                const Text('Se crearon nuevas interfaces para ayudar a los usuarios a encontrar las funciones de forma más rapida.', style: TextStyle(fontFamily: "Cabin", fontSize: 20)),
              ],
            ),
      );
  }
}