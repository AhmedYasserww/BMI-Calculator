import 'package:flutter/material.dart';
class CalculatorResultSection extends StatelessWidget {
  const CalculatorResultSection({super.key, required this.result});
final double result ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Container(
            height: 38,
            color: const Color(0xFF7ec7da),
          ),
        ),
        const SizedBox(width: 15),
        const Text("Result = ", style: TextStyle(fontSize: 35, color: Colors.white)),
        Text("$result", style: const TextStyle(fontSize: 35, color: Colors.white)),
        const SizedBox(width: 15),
        Expanded(
          child: Container(
            height: 38,
            color: const Color(0xFF7ec7da),
          ),
        ),
      ],
    );
  }
}
