import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImg = "assets/images/dice-5.png";

  void randomNumber() {
    var diceNumber = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImg = "assets/images/dice-$diceNumber.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activeDiceImg),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: randomNumber,
          child: const Text("Roll Dice"),
        )
      ],
    );
  }
}
