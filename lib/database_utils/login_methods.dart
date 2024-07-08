import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reciprocity/views/home.dart';

class LoginMethods {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool isChecked = false;

  void initState(Function setState) {
    _loadUserEmailPassword(setState);
  }

  Future<void> signin(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDocument =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        String? username = userDocument['username'];

        if (username != null) {
          Fluttertoast.showToast(
              msg: 'Login Successful!\nWelcome $username',
              gravity: ToastGravity.BOTTOM);
          if (isChecked) {
            _saveUserEmailPassword();
          } else {
            _clearUserEmailPassword();
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(
                username: username,
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
    }
  }

  void _loadUserEmailPassword(Function setState) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('email') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
      isChecked = prefs.getBool('remember_me') ?? false;
    });
  }

  void _saveUserEmailPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailController.text);
    prefs.setString('password', passwordController.text);
    prefs.setBool('remember_me', isChecked);
  }

  void _clearUserEmailPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
    prefs.remove('remember_me');
  }
}
