import 'package:flutter/material.dart';
import 'package:flutter_learning_app/QuizApp/dice_roller.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomCenter;
//Const , Final ,var , DataType = {Alignment , String etc}

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}

int randomNumber() {
  return 0;
}
