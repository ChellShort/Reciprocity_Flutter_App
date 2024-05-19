import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: const Center(child: Text('Posts')),
    );
  }
}