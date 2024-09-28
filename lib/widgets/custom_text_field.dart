import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText ;
  final String hintText;
  final IconData icon;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.obscureText = false, this.onSaved,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.controller, this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        keyboardType: keyboardType,
        controller:controller ,
        onSaved: onSaved,
        validator: validator,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300),
          suffixIcon: suffixIcon,
          prefixIcon: Icon(icon, size: 35),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 3),
          ),
        ),
      ),
    );
  }
}
