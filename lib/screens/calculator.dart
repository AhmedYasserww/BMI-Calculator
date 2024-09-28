import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task11/widgets/calculator_result_section.dart';

import '../widgets/calculator_form_field.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  double result = 0;
 late TextEditingController num1 ;
  late TextEditingController num2;
@override
  void initState() {
   num1 = TextEditingController();
   num2 = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
  num1.dispose();
  num2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f0f33),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF111328),
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CalculatorFormField(num1: num1, num2: num2),
            const SizedBox(height: 40),
            CalculatorResultSection(result: result,),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color(0xFF7ec7da),
                ),
                width: double.infinity,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color(0xFF4054b4),
                      onPressed: () {
                        setState(() {
                          double number1 = double.tryParse(num1.text) ?? 0;
                          double number2 = double.tryParse(num2.text) ?? 0;
                          result = number1 + number2;
                        });
                      },
                      child: const Text("+", style: TextStyle(fontSize: 45)),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      backgroundColor: const Color(0xFF4054b4),
                      onPressed: () {
                        setState(() {
                          double number1 = double.tryParse(num1.text) ?? 0;
                          double number2 = double.tryParse(num2.text) ?? 0;
                          result = number1 - number2;
                        });
                      },
                      child: const Text("-", style: TextStyle(fontSize: 45)),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      backgroundColor: const Color(0xFF4054b4),
                      onPressed: () {
                        setState(() {
                          double number1 = double.tryParse(num1.text) ?? 0;
                          double number2 = double.tryParse(num2.text) ?? 0;
                          result = number1 * number2;
                        });
                      },
                      child: const Text("x", style: TextStyle(fontSize: 35)),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      backgroundColor: const Color(0xFF4054b4),
                      onPressed: () {
                        setState(() {
                          double number1 = double.tryParse(num1.text) ?? 0;
                          double number2 = double.tryParse(num2.text) ?? 0;
                          result = number1 / number2;
                        });
                      },
                      child: const Text("/", style: TextStyle(fontSize: 30)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

