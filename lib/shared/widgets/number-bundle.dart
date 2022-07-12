import 'package:flutter/material.dart';
import 'package:lotto_picker/shared/widgets/number-ball.dart';

class NumberBundle extends StatelessWidget {
  final List<int> numbers;
  const NumberBundle({
    Key? key,
    required this.numbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: numbers
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
              child: NumberBall(number: e),
            ),
          )
          .toList(),
    );
  }
}
