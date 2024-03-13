import 'package:flutter/material.dart';
import 'package:reciprocity/ui/views/Pagina1.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  static String id = 'login_view';

  final Map<String, String> userCredentials = {
    'usuario1@example.com': 'contraseña1',
    'usuario2@example.com': 'contraseña2',
  };

  void _login(BuildContext context, String email, String password) {
    if (userCredentials.containsKey(email) && userCredentials[email] == password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Inicio de sesión exitoso'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pushNamed(context, Pagina1.id);
    } else {
      // Si las credenciales son incorrectas, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credenciales incorrectas'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: size.height * 0.05,
              ),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onChanged: (value) {},
              ),
            ),

            // password
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .1,
              ),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onChanged: (value) {},
              ),
            ),

            // button
            ElevatedButton(
              onPressed: () {
                _login(
                  context,
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
