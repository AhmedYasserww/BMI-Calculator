import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task11/cubit/counter_cubit.dart';
import 'package:task11/cubit/counter_state.dart';
import 'package:task11/screens/result_Calculate.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    double bmi = BlocProvider.of<CalculatorCubit>(context).bmi;
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: Scaffold(
        backgroundColor:  const Color(0xff272B49FF),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF111328),
          title: const Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: BlocConsumer<CalculatorCubit, CalculatorState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<CalculatorCubit>(context).updateColor(true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: BlocProvider.of<CalculatorCubit>(context).maleColor,
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.male, size: 80, color: Colors.white),
                                  Text(
                                    "Male",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
                                  ),
                                  SizedBox(height: 16,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<CalculatorCubit>(context).updateColor(false);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: BlocProvider.of<CalculatorCubit>(context).femaleColor,
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.female, size: 80, color: Colors.white),
                                  Text(
                                    "Female",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
                                  ),
                                  SizedBox(height: 16,)

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo,
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "HEIGHT",
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                "${BlocProvider.of<CalculatorCubit>(context).height.toInt()}",
                                style: const TextStyle(fontSize: 65, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "cm",
                                style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal, color: Colors.black38),
                              ),
                            ],
                          ),
                          Slider(
                            activeColor: Colors.white,
                            inactiveColor: Colors.black38,
                            min: 0,
                            max: 250,
                            value: BlocProvider.of<CalculatorCubit>(context).height,
                            onChanged: (val) {
                              BlocProvider.of<CalculatorCubit>(context).updateHeight(val);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.indigo,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "WEIGHT",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "${BlocProvider.of<CalculatorCubit>(context).weight}",
                                  style: const TextStyle(fontSize: 65, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<CalculatorCubit>(context).incrementWeight();
                                      },
                                      icon: const Icon(Icons.add_circle, size: 45, color: Colors.grey),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<CalculatorCubit>(context).decrementWeight();
                                      },
                                      icon: const Icon(Icons.remove_circle, size: 45, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.indigo,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "AGE",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "${BlocProvider.of<CalculatorCubit>(context).age}",
                                  style: const TextStyle(fontSize: 65, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<CalculatorCubit>(context).incrementAge();
                                      },
                                      icon: const Icon(Icons.add_circle, size: 45, color: Colors.grey),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<CalculatorCubit>(context).decrementAge();
                                      },
                                      icon: const Icon(Icons.remove_circle, size: 45, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          bmi = BlocProvider.of<CalculatorCubit>(context).calcBmi();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ResultView(bmi: bmi),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "CALCULATE",
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is WeightIncrementState) {
              // Additional logic for incremented weight state if needed
            }
          },
        ),
      ),
    );
  }
}
