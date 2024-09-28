import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.onPressed, required this.textButton,this.color,  this.globalKey,  this.emailController,  this.passwordController});
  final GlobalKey<FormState>? globalKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final void Function()? onPressed;
  final String textButton;
  final Color ? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:  color ?? const Color(0xFF0f0f33),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child:  Text(
          textButton,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
