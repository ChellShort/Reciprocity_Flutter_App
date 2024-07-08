import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegisterMethods {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> emailExists(String email) async {
    final result = await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return result.docs.isNotEmpty;
  }

  Future<void> register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text;
      String username = usernameController.text.trim();

      bool emailInUse = await emailExists(email);
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
        return;
      }

      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'username': username,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              style: TextStyle(color: Colors.black),
              'Registration Successful!',
            ),
          ),
        );

        Navigator.pop(context);
      } on PlatformException catch (error) {
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
  }
}
