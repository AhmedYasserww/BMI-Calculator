import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task11/cubit/counter_state.dart';

class CalculatorCubit extends Cubit<CalculatorState>{
  CalculatorCubit():super(InitialCalculatorState());
  int weight =0;
  int age =0;
  double height = 120;
  double bmi = 0.0;
  Color buttonColor = Colors.indigo;
  Color buttonColor2 = Colors.indigo;
  bool isMale = true ;
  Color maleColor = Colors.indigo;
  Color femaleColor = Colors.indigo;



  void incrementWeight(){
    weight ++;
    emit(WeightIncrementState());
  }
  void decrementWeight(){
    if(weight>0) {
      weight--;
    }
    emit(WeightDecrementState());
  }
  void incrementAge(){
    age ++;
    emit(AgeIncrementState());
  }
  void decrementAge(){
    if(age >0) {
      age --;
    }
    emit(AgeDecrementState());
  }
  void updateHeight(double newHeight) {
    height = newHeight;
    emit(HeightChangedState(height: newHeight));
  }


  void updateColor(bool isMaleSelected) {
    isMale = isMaleSelected;
    if (isMaleSelected) {
      maleColor = Colors.blue;
      femaleColor = Colors.indigo;
    } else {
      maleColor = Colors.indigo;
      femaleColor = Colors.blue;
    }
    emit(ColorUpdatedState());
  }

  double calcBmi(){
     return weight / ((height * height) / 10000);
  }

}