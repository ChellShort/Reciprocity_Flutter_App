import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      centerTitle: true,
      title: const Image(
          height: 50, image: AssetImage('assets/images/logoconleyenda.png')),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
