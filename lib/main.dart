import 'package:flutter/material.dart';
import 'router/routes.dart';
import 'ui/views/login_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue, // Define el color primario
        visualDensity: VisualDensity.adaptivePlatformDensity, // Define la densidad visual
        fontFamily: 'Roboto', // Define la fuente por defecto
        // Agrega más ajustes de tema aquí según sea necesario
      ),
      initialRoute: LoginView.id,
      routes: customRoutes,
    );
  }
}
