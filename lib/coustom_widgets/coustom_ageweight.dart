import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';

class AgeWeightWidget extends StatelessWidget {
  const AgeWeightWidget({
    super.key,
    required this.cardWidth,
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  final double cardWidth;
  final String title;
  final int value;
  final void Function()? onIncrement;
  final void Function()? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardWidth,
      width: cardWidth,
      decoration: cardDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$title",
            style: descStyle,
          ),
          Text(
            "$value",
            style: descStyle.copyWith(fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                color: Colors.black,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(bgColor),
                ),
                onPressed: onDecrement,
                icon: Icon(Icons.remove),
              ),
              IconButton(
                color: Colors.black,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(bgColor),
                ),
                onPressed: onIncrement,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
