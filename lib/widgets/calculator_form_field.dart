import 'package:flutter/material.dart';

import 'custom_text_field.dart';
class CalculatorFormField extends StatelessWidget {
  const CalculatorFormField({
    super.key,
    required this.num1,
    required this.num2,
  });

  final TextEditingController num1;
  final TextEditingController num2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        color: Color(0xFF7ec7da),
      ),
      width: double.infinity,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            keyboardType: TextInputType.number,
            controller: num1,
            hintText: "Num1",
            icon: Icons.looks_one,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            keyboardType: TextInputType.number,
            controller: num2,
            hintText: "Num2",
            icon: Icons.looks_two,
          ),
        ],
      ),
    );
  }
}
