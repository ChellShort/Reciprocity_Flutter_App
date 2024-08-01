import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: Card(
          color: Color(0xff522258),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                Text(
                  'LANZAMOS LA VERSIÓN 1.0 DE LA APLICACIÓN',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold, color: Colors.white,
                    fontFamily: "Fjalla"
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(width:200, "assets/images/cat.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Estamos emocionados de presentar la versión 1.0 de TLTI, esperamos que la disfruten y puedan ir a probarla cuanto antes',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "Cabin"
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        );
  }
}