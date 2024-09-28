import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  double result = 0;
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f0f33),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111328),
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          // Icon(CupertinoIcons.divide),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                color: Color(0xFF7ec7da),
              ),
              width: double.infinity,
             // height: MediaQuery.of(context).size.height * 0.4,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: num1,
                    style: const TextStyle(fontSize:22 , fontWeight: FontWeight.bold),
                  //  strutStyle: const StrutStyle(height: 1),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Number1",
                      labelStyle:const TextStyle(fontSize: 20, color: Colors.black,fontWeight:FontWeight.w300),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:const BorderSide(width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 3),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: num2,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                   // strutStyle: const StrutStyle(height: 1),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Number2",
                      labelStyle:const TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w300),
                      enabled: true,
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
                ],
              ),
            ),
            const SizedBox(height: 60,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 38,
                    color: const Color(0xFF7ec7da),
                  ),
                ),
               const SizedBox(width: 15,),
               const Text("Result = ", style: TextStyle(fontSize: 35, color: Colors.white)),
                Text("$result", style: const TextStyle(fontSize: 35, color: Colors.white)),
               const SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    height: 38,
                    color: const Color(0xFF7ec7da),
                  ),
                ),
              ],
            ),
           const SizedBox(height: 70,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
                color: Color(0xFF7ec7da),
              ),
              width: double.infinity,
              height: 300,
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
                  const SizedBox(width: 20), // Add spacing between buttons
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
                  const SizedBox(width: 20), // Add spacing between buttons
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
                  const SizedBox(width: 20), // Add spacing between buttons
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
          ],
        ),
      ),
    );
  }
}
