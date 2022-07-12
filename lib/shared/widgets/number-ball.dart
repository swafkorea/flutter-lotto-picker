import 'package:flutter/material.dart';
import 'package:lotto_picker/constants.dart';

class NumberBall extends StatelessWidget {
  final int number;
  const NumberBall({
    Key? key,
    required this.number,
  }) : super(key: key);

  Color get ballColor {
    final index = (number.toDouble() ~/ 10.0);
    return numberColors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ballSize,
      height: ballSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            ballSize / 2,
          ),
        ),
        color: ballColor,
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: ballSize / 2),
      ),
    );
  }
}
