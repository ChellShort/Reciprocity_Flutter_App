
//Esta clase un constructor en forma de for para poder reproducir todos los elementos del drawer sin necesidad de escribirlos una y otra vez, si 
//quieres agregar un nuevo elemento solo tienes que agregarlo en la lista DrawerItems y listo, se reproducira en el drawer
//El drawer depende de una clase llamada drawer_items, asi que no la borres y no se te olvide importarla

import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/drawer_header.dart';
import 'package:reciprocity/utils/drawer_items.dart';

class DrawerCustom extends StatelessWidget {
  final void Function(int) cIndex; //Funcion que se encarga de cambiar el index del drawer
  const DrawerCustom({super.key, required this.cIndex}); //Se pone required porque es un parametro obligatorio

  @override
  Widget build(BuildContext context) {

    List<Items> itemsList = DrawerItems().items;

    return Drawer(
      child: ListView(
        children: [
          ListView(
            //Esto hace que no de el error ese rojo que tanto odio
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            //Esto hace que no de el error ese rojo que tanto odio
            
            children: <Widget>[
              const DrawerHeaderCustom(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(), //Esto evita que no se pueda hacer sroll en el drawer
                shrinkWrap: true,//No entiendo bien esto, pero es importante
                itemCount: itemsList.length, //Cantidad de veces que reproduce la informacion
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Icon(itemsList[i].icon),
                    title: Text(itemsList[i].title),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    subtitle: Text(itemsList[i].subtitle),
                    onTap: () { //Al dar tap en n elemento se cambio al mismo tiempo el valor de la variable index en el landing_page
                      cIndex(i);
                      Navigator.pop(context);
                    },
                  );
                }
              ),
              
            ],
            
          ),
        ],
      ),
    );
  }
}

class Items{
  String title ;
  IconData icon;
  String subtitle;


  Items({
    required this.title, 
    required this.icon, 
    required this.subtitle
    });
}