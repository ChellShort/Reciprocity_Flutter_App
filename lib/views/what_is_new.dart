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
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(color: const Color(0xff522258)),
              child: const Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('What is new?',
                    style: TextStyle(
                        fontFamily: "Fjalla",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )),
          const Text('LOGIN',
              style: TextStyle(fontFamily: "Fjalla", fontSize: 20)),
          Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(color: Colors.black, border: Border.all()),
                  child: Image.asset(
                    "assets/images/im1.jpg",
                    width: 175,
                    height: 400,
                  )),
              Container(
                  decoration:
                      BoxDecoration(color: Colors.black, border: Border.all()),
                  child: Image.asset(
                    "assets/images/Screenshot_1722545171.png",
                    width: 175,
                    height: 400,
                  )),
            ],
          ),
          SizedBox(height: 30,),
          const Text('Inicio',
              style: TextStyle(fontFamily: "Fjalla", fontSize: 20)),
          Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(color: Colors.black, border: Border.all()),
                  child: Image.asset(
                    "assets/images/im2.jpg",
                    width: 175,
                    height: 400,
                  )),
              Container(
                  decoration:
                      BoxDecoration(color: Colors.black, border: Border.all()),
                  child: Image.asset(
                    "assets/images/Screenshot_1722545600.png",
                    width: 175,
                    height: 400,
                  )),
            ],
          ),
          Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(color: Colors.black, border: Border.all()),
                  child: Image.asset(
                    "assets/images/Screenshot_1722562829.png",
                    width: 175,
                    height: 400,
                  )),
              Container(
                  decoration:
                      BoxDecoration(color: Colors.black, border: Border.all()),
                  child: Image.asset(
                    "assets/images/Screenshot_1722562906.png",
                    width: 175,
                    height: 400,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
