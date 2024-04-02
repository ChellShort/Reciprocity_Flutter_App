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
        const SnackBar(
          content: Text('Inicio de sesión exitoso'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pushNamed(context, Pagina1.id);
    } else {
      // Si las credenciales son incorrectas, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
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

            //texto
              const Icon(
                Icons.person,
                size: 100,
              ),
              
              const Text(
                    'MEMBER LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                ),

              const SizedBox(height: 40),

              // email
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.orange, // Color inicial del gradiente
                      Colors.red, // Color final del gradiente
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .1,
                ),
                
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),

              const SizedBox(height: 20),

              // password
              Container(

                width: size.width * 0.8,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.orange, // Color inicial del gradiente
                      Colors.red, // Color final del gradiente
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),

                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .1,
                ),


                child: TextField(
                  
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            
            const SizedBox(height: 20),

            // button
            Container(
              
               width: size.width * 0.5,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.orange, // Color inicial del gradiente
                      Colors.red, // Color final del gradiente
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),


              child: ElevatedButton(

                onPressed: () {
                  _login(
                    context,
                    emailController.text,
                    passwordController.text,
                  );
                },

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.transparent,
                ),

                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),


            ),

           Container(
              padding: const EdgeInsets.symmetric(horizontal: 50), // Ajusta el espacio entre los bordes y el Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinea los elementos a los extremos
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                    },
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recuérdame',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                      ],
                    ),  
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ]
                    )
                    )
                ],
              ),
            ),

            const SizedBox(height: 120),

            const Text(
                    'Not a member?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                ),

            Container(
              
               width: size.width * 0.5,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.orange, // Color inicial del gradiente
                      Colors.red, // Color final del gradiente
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),


              child: ElevatedButton(

                onPressed: () {
                },

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                ),

                child: const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ]
        
        ),
      ),
    );
  }
}
