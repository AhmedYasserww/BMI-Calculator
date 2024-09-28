
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task11/cubit/counter_cubit.dart';
import 'package:task11/cubit/counter_state.dart';
import 'package:task11/screens/result_Calculate.dart';
class Calculate extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
   double bmi = BlocProvider.of<CalculatorCubit>(context).bmi;
    return BlocProvider(
      create: (context)=>CalculatorCubit(),
      child: Scaffold(
        backgroundColor :  const Color(0xFF272B49FF),
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
        backgroundColor:const Color(0xFF111328),
            title:const  Text("BMI Calculator",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.white),),
          ),
          body:BlocConsumer<CalculatorCubit,CalculatorState>(
            builder:(context,state){
            return  SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            height: 170,
                            width: 170,
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.male, size: 80, color: Colors.white),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
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
                            height: 170,
                            width: 170,
                            margin: const EdgeInsets.only(top: 20, right: 20),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.female, size: 80, color: Colors.white),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15,),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.indigo,),
                    height: 170,
                    width: double.infinity,

                    margin: const EdgeInsets.only(left: 20 , right: 20),
                    child:
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex :1,
                          child: const Text(
                            "HEiGHT",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,


                            children: [
                              Text(
                                "${BlocProvider.of<CalculatorCubit>(context).height.toInt()}",
                                style: const TextStyle(fontSize: 65,color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "cm", // Text "cm" with a different font size
                                style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal, color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.black38,
                              min: 0,max: 250,
                              value:BlocProvider.of<CalculatorCubit>(context).height
                              , onChanged:(val){
                                BlocProvider.of<CalculatorCubit>(context).updateHeight(val);
                          }

                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),

                Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.indigo,
                              ),
                              height: 170,
                              width: 170,
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: const Text(
                                      "WEIGHT",
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "${BlocProvider.of<CalculatorCubit>(context).weight}",
                                      style: const TextStyle(fontSize: 65, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<CalculatorCubit>(context).incrementWeight();
                                            },
                                            icon: const Icon(Icons.add_circle, size: 55, color: Colors.grey),
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            onPressed: () {
                                              BlocProvider.of<CalculatorCubit>(context).decrementWeight();
                                            },
                                            icon: const Icon(Icons.remove_circle, size: 55, color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.indigo,
                              ),
                              height: 170,
                              width: 170,
                              margin: const EdgeInsets.only(right: 20),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: const Text(
                                        "AGE",
                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "${BlocProvider.of<CalculatorCubit>(context).age}",
                                        style: const TextStyle(fontSize: 65, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {
                                                BlocProvider.of<CalculatorCubit>(context).incrementAge();

                                              },
                                              icon: const Icon(Icons.add_circle, size: 55, color: Colors.grey),
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {
                                                BlocProvider.of<CalculatorCubit>(context).decrementAge();

                                              },
                                              icon: const Icon(Icons.remove_circle, size: 55, color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],),




                  const SizedBox(height: 20,),
                  Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo,
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          bmi = BlocProvider.of<CalculatorCubit>(context).calcBmi();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Result(bmi: bmi),
                            ),
                          );
                        },

                        child: const Text(
                          "CALCULATE",
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                  ),


                ],),
            );
          } , listener: (context, state) {
      if (state is WeightIncrementState) {
      //  int weight = BlocProvider.of<CalculatorCubit>(context).weight;
      } else {
      // Handle other states if needed
      }
      },
          )



           ),
    );
  }
}