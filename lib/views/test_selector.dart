import 'package:flutter/material.dart';
import 'package:reciprocity/utils/exams_items.dart';
import 'package:reciprocity/views/tests.dart';

class TestSelector extends StatefulWidget {
  const TestSelector({super.key});

  @override
  State<TestSelector> createState() => _TestPruebaState();
}

class _TestPruebaState extends State<TestSelector> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WELCOME',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: "Fjalla"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Please choose your training',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Cabin"))
                ],
              ),
            ],
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tests(
                        examsList: listtileitems[index]['selectedexams']),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: const Color(0xff522258),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(5.0),
                    title: Center(child: Text(listtileitems[index]['title'], style: const TextStyle(fontFamily: "Fjalla", fontSize: 20, color: Colors.white),)),
                    subtitle:
                        Center(child: Text(listtileitems[index]['subtitle'], style: const TextStyle(fontFamily: "Cabin", fontSize: 20, color: Colors.white))),
                  ),
                ),
              ),
            );
          },
          itemCount: listtileitems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ]),
    );
  }
}
