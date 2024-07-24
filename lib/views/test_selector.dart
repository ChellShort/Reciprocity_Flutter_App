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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'WELCOME TO TLTI',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Please choose your training',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
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
                    color: Color.fromARGB(255, 192, 192, 192),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(5.0),
                    title: Center(child: Text(listtileitems[index]['title'])),
                    subtitle:
                        Center(child: Text(listtileitems[index]['subtitle'])),
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
