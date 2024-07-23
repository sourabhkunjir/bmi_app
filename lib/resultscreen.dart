import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmi});
  final double bmi;
  String result() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 24.9) {
      return "Normal";
    } else if (bmi < 29.9) {
      return "Overweight";
    } else {
      return "obese";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: bgColor),
        title: Text(
          "BMI Result",
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result(),
            style: titleTextStyle,
          ),
          Text(bmi.toStringAsFixed(2),
              style: titleTextStyle.copyWith(fontSize: 40)),
        ],
      )),
    );
  }
}
