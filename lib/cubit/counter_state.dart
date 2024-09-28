

class CalculatorState {}
class WeightIncrementState extends CalculatorState{}
class WeightDecrementState extends CalculatorState{}
class AgeIncrementState extends CalculatorState{}
class AgeDecrementState extends CalculatorState{}


class HeightChangedState extends CalculatorState{
  final double height;
  HeightChangedState({required this.height});
}

class InitialCalculatorState extends CalculatorState{}


class BmiClaculateState extends CalculatorState {}
class ColorUpdatedState extends CalculatorState {}
