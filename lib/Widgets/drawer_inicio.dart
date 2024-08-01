//Esta clase un constructor en forma de for para poder reproducir todos los elementos del drawer sin necesidad de escribirlos una y otra vez, si
//quieres agregar un nuevo elemento solo tienes que agregarlo en la lista DrawerItems y listo, se reproducira en el drawer
//El drawer depende de una clase llamada drawer_items, asi que no la borres y no se te olvide importarla

import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/drawer.dart';
import 'package:reciprocity/Widgets/drawer_header.dart';
import 'package:reciprocity/utils/drawer_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reciprocity/views/landing_page.dart';
import 'package:reciprocity/views/login.dart';

class DrawerCustomInicio extends StatelessWidget {
  final void Function(int)
      cIndex; //Funcion que se encarga de cambiar el index del drawer
  final String? username;
  final String? level;
  const DrawerCustomInicio(
      {super.key,
      required this.cIndex,
      required this.username,
      required this.level}); //Se pone required porque es un parametro obligatorio

  @override
  Widget build(BuildContext context) {
    List<Items> itemsList = DrawerItemsInicio().items;

    return Drawer(
      child: ListView(
        children: [
          ListView(
            //Esto hace que no de el error ese rojo que tanto odio
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            //Esto hace que no de el error ese rojo que tanto odio

            children: <Widget>[
              DrawerHeaderCustom(
                username: username ?? 'user',
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: Text('Current Level: $level', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Fjalla"),)),
              ),
              ListView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), //Esto evita que no se pueda hacer sroll en el drawer
                  shrinkWrap: true, //No entiendo bien esto, pero es importante
                  itemCount: itemsList
                      .length, //Cantidad de veces que reproduce la informacion
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: Icon(itemsList[i].icon, color: const Color(0xff8C3061)),
                      title: Text(itemsList[i].title, style: const TextStyle(fontFamily: "Fjalla", fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      subtitle: Text(itemsList[i].subtitle, style: const TextStyle(fontFamily: "Cabin")),
                      onTap: () {
                        //Al dar tap en n elemento se cambio al mismo tiempo el valor de la variable index en el landing_page
                        cIndex(i);
                        Navigator.pop(context);
                      },
                    );
                  }),
              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Color(0xff8C3061)),
                title: const Text('Exit', style: TextStyle(fontFamily: "Fjalla", fontWeight: FontWeight.bold),),
                trailing: const Icon(Icons.arrow_forward_ios),
                subtitle: const Text('Return to the welcome menu', style: TextStyle(fontFamily: "Cabin")),
                onTap: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LandingPage(),
                      ),
                    );
                  } catch (e) {
                    // Manejo de errores si hay algún problema al cerrar sesión
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error al cerrar sesión: $e')),
                    );
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
