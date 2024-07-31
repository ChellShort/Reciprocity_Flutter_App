import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:reciprocity/Widgets/app_bar.dart';
import 'package:reciprocity/views/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isLoading = false;

  Future<bool> _emailExists(String email) async {
    final result = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return result.docs.isNotEmpty;
  }

  Future<void> _showLevelDialog(String userId) async {
    String? selectedLevel = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: SimpleDialog(
            
            contentPadding: EdgeInsets.all(8.0),
            title: const Text('Seleccione su nivel de inglés'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'A1');
                },
                child: const Text('A1'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'A2');
                },
                child: const Text('A2'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'B1');
                },
                child: const Text('B1'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'B2');
                },
                child: const Text('B2'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'C1');
                },
                child: const Text('C1'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'C2');
                },
                child: const Text('C2'),
              ),
            ],
          ),
        );
      },
    );

    if (selectedLevel != null) {
      await _firestore.collection('users').doc(userId).update({
        'level': selectedLevel,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            style: const TextStyle(color: Colors.black),
            'Nivel de inglés guardado como: $selectedLevel',
          ),
        ),
      );
    }
  }

  _register() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text;
      String username = _usernameController.text.trim();

      // Verificar si el email ya existe
      bool emailInUse = await _emailExists(email);
      if (emailInUse) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              style: TextStyle(color: Colors.black),
              'Error: El correo electrónico ya está en uso',
            ),
          ),
        );
        return; // Cancelar registro
      }

      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Guardar el usuario en Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'username': username,
          'level': 'unknown'
        });

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              style: TextStyle(color: Colors.black),
              'Registration Successful!',
            ),
          ),
        );

        // Mostrar cuadro de diálogo para seleccionar nivel de inglés
        await _showLevelDialog(userCredential.user!.uid);

        Navigator.pop(context);
      } on PlatformException catch (error) {
        // Mostrar mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              style: const TextStyle(color: Colors.black),
              'Error: ${error.toString()}',
            ),
          ),
        );
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            'Register',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _register,
                      child: const Text('Register'),
                    ),
                  ),
                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const Text('Already have an account?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text('Log In'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
