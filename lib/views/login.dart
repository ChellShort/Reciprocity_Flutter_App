import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reciprocity/Widgets/app_bar.dart';
import 'package:reciprocity/views/home.dart';
import 'package:reciprocity/views/forgot_password.dart';
import 'package:reciprocity/views/register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isChecked = false;
  bool isLoginButtonPressed = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
    _loadUserEmailPassword();
  }

  Future<void> _checkCurrentUser() async {
    User? user = auth.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDocument =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        String? username = userDocument['username'];
        String? level = userDocument['level'];

        if (username != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(
                username: username,
                level: level,
              ),
            ),
          );
        }
      }
    }
  }

  Future<void> _signin(String email, String password) async {
    setState(() {
      isLoading = true;
    });

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDocument =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        String? username = userDocument['username'];
        String? level = userDocument['level'];

        if (username != null) {
          Fluttertoast.showToast(
              msg: 'Login Successful!\nWelcome $username',
              gravity: ToastGravity.BOTTOM);
          if (isChecked == true) {
            _saveUserEmailPassword();
          } else {
            _clearUserEmailPassword();
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(
                username: username,
                level: level,
              ),
            ),
          );
        }
      }
    } catch (error) {
      String e = error.toString();

      switch (e) {
        case '[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.':
          e = 'Credentials not registered. Please register first.';
          break;
        case '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.':
          e = 'Too many unsuccessful login attempts. Please try again later.';
          break;
        default:
          e = 'Error: $e';
          break;
      }
      Fluttertoast.showToast(msg: e, gravity: ToastGravity.BOTTOM);
    } finally {
      setState(() {
        isLoading = false; // Ocultar la barra de progreso
      });
    }
  }

  void _loadUserEmailPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      isChecked = prefs.getBool('remember_me') ?? false;

      // Iniciar sesión automáticamente si isChecked es verdadero
      if (isChecked &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty && isLoginButtonPressed) {
        _signin(_emailController.text, _passwordController.text);
      }
    });
  }

  void _saveUserEmailPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
    prefs.setString('password', _passwordController.text);
    prefs.setBool('remember_me', isChecked);
  }

  void _clearUserEmailPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    prefs.remove('remember_me');
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
            'Member Login',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email, color: Color(0xff8C3061) ),
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
                      icon: Icon(Icons.lock, color: Color(0xff8C3061 )),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          );
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 217, 95, 89))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoginButtonPressed = true;
                            isLoading = true;
                          });
                          _signin(
                              _emailController.text, _passwordController.text);
                        }
                      },
                      child: const Text('LOG IN',style: TextStyle(fontFamily: "Cabin", color: Colors.white)),
                    ),
                  ),
                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),            ),
          ),
          Column(
            children: [
              const Text('Not a member?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 217, 95, 89))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: const Text('REGISTER NOW!', style: TextStyle(fontFamily: "Cabin", color: Colors.white),),
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
