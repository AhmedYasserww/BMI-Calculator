import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task11/utils/app_router.dart';
import 'package:task11/widgets/custom_button.dart';
import 'package:task11/widgets/custom_text_field.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool visible = true;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Color(0xFF7ec7da),
      ),
      child: Form(
        key: globalKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomTextField(
              controller: emailController,
              hintText: "Email",
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              hintText: "Password",
              icon: Icons.password,
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
              onPressed: () async {
                await _handleLogin(context);
              },
              textButton: "LogIn",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      try {
        await _signInUser(context);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed: ${e.toString()}'),
            ),
          );
        }
      }
    }
  }

  Future<void> _signInUser(BuildContext context) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    User? user = userCredential.user;
    if (user != null) {
      if (!user.emailVerified) {
        await _handleEmailNotVerified(user, context);
      } else {
        if (mounted) {
          _showLoginSuccessMessage(context);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
      }
    }
  }

  Future<void> _handleEmailNotVerified(User user, BuildContext context) async {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Email not verified. Please check your email for verification.'),
          action: SnackBarAction(
            label: 'Resend Verification',
            onPressed: () async {
              await user.sendEmailVerification();
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Verification email resent!'),
                  ),
                );
              }
            },
          ),
        ),
      );
    }
  }

  void _showLoginSuccessMessage(BuildContext context) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Log in successful'),
        ),
      );
    }
  }
}
