import 'package:flutter/material.dart';

class DrawerHeaderCustom extends StatelessWidget {
  const DrawerHeaderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(size: 40,Icons.engineering),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('OPTIONS'),
                    )])),
              );
  }
}