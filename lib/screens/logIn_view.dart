import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/logIn_form.dart';
class LogInView extends StatelessWidget {
const LogInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f0f33),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: const Color(0xFF111646),
        title: const Text(
          "Log in",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(

              "Welcome!",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
             SizedBox(height: 50),
             LogInForm(),
          ],
        ),
      ),
    );
  }
}




