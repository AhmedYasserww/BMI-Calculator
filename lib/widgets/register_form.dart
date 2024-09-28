import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task11/widgets/custom_button.dart';
import 'package:task11/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../data/shared_preference.dart';
import '../utils/app_router.dart';
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool visible = true;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius:BorderRadius.all(Radius.circular(40)),
        color: Color(0xFF7ec7da),
      ),
      child: Form(
        key: globalKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
             CustomTextField(
               controller:nameController ,
                validator: (value) => value == null || value.isEmpty ? 'Field is required' : null,
              hintText: "Username",
              icon: Icons.person,
              obscureText: false,
            ),
            const SizedBox(height: 20),
             CustomTextField(
              controller: phoneNumberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required. Please enter a phone number.';
                } else if (value.length != 11) {
                  return 'Phone number must be exactly 11 digits long.';
                }
                return null;
              },
              hintText: "Phone Number",
              icon: Icons.phone,
            ),
            const SizedBox(height: 20),
             CustomTextField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field is required';
                }
                final bool emailValid = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                ).hasMatch(value);
                return emailValid ? null : 'Email format must be valid';
              },
              hintText: "Email",
              icon: Icons.email,
            ),
            const SizedBox(height: 20),
             CustomTextField(
               controller: passwordController,
               validator: (value) => value == null || value.isEmpty ? 'Field is required' : null,

               hintText: "Password",
              icon: Icons.lock,
              obscureText: visible,
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    visible =! visible;
                  });

                },
                icon: Icon(visible ? Icons.visibility_off : Icons.visibility,color: Colors.blue,),

            ),
             ),
            const SizedBox(height: 40),
            CustomButton(
                globalKey: globalKey,
                emailController: emailController,
                passwordController: passwordController,
                onPressed:
                  () async {
                    await _handleRegistration();

            }, textButton: "Register"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  Future<void> _handleRegistration() async {
    if (globalKey.currentState!.validate()) {
      try {
        await _saveUserData();
        await _registerUser();
      } catch (e) {
        log(e.toString());
        _showSnackBar('Registration failed: ${e.toString()}');
      }
    }
  }

  Future<void> _saveUserData() async {
    try {
      log("before saving data");
      await saveUserData(
        name: nameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
      );
      log("after saving data");
      Map<String, String?> userData = await getUserData();
      log("error on recall data");
      log("Name: ${userData['name']}");
      log("Email: ${userData['email']}");
      log("Phone Number: ${userData['phoneNumber']}");
      log("Password: ${userData['password']}");
    } catch (e) {
      log("error on save data: $e");
    }
  }

  Future<Map<String, String?>> getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return {
        'name': prefs.getString('name'),
        'email': prefs.getString('email'),
        'phoneNumber': prefs.getString('phoneNumber'),
        'password': prefs.getString('password'),
      };
    } catch (e) {
      log("error in input field $e");
      return {};
    }
  }

  Future<void> _registerUser() async {
    log("Email: ${emailController.text}");
    log("Password: ${passwordController.text}");

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _showSnackBar('Email and password must not be empty');
      return;
    }

    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    log("User registered");

    User? user = userCredential.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      log("Verification email sent");
      _showSnackBar('Verification email sent! Please check your inbox.');
      GoRouter.of(context).push(AppRouter.kLogin);
    }
  }


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
