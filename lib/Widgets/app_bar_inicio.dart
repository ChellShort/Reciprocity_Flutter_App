import 'package:flutter/material.dart';

class AppBarCustomInicio extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: 
          const Image(
              height: 50, 
              image: AssetImage('assets/images/logoconleyenda.png')
            ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
