import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task11/widgets/register_form.dart';



class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f0f33),
      appBar: AppBar(
         leading: IconButton(onPressed: (){
           GoRouter.of(context).pop();
         }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        centerTitle: true,
        backgroundColor: const Color(0xFF111646),
        title:  const Text(

          "Register",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 40),
             Text(
              "Welcome to our app!",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 50),
             RegisterForm(),
          ],
        ),
      ),
    );
  }
}

