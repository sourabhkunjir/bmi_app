import 'package:bmi_app/coustom_widgets/coustom_ageweight.dart';
import 'package:bmi_app/coustom_widgets/coustom_malefemalewidget.dart';
import 'package:bmi_app/provider.dart';
import 'package:bmi_app/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_app/constants.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = (width / 2) - 16;
    final height = ref.watch(heightProvider);
    final weight = ref.watch(weightProvider);
    final age = ref.watch(ageProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("BMI Calculator", style: titleTextStyle),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            MaleFemale(cardWidth: cardWidth, isMale: true),
            MaleFemale(cardWidth: cardWidth, isMale: false),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              width: width - 22,
              height: cardWidth,
              decoration: cardDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Height",
                    style: descStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: descStyle.copyWith(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "cm",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Slider(
                    min: 100,
                    max: 200,
                    activeColor: Colors.pink,
                    value: height,
                    onChanged: (double value) {
                      ref.read(heightProvider.notifier).state = value;
                    },
                  )
                ],
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            AgeWeightWidget(
              cardWidth: cardWidth,
              title: "Weight",
              value: weight,
              onDecrement: () {
                ref.read(weightProvider.notifier).decrement();
              },
              onIncrement: () {
                ref.read(weightProvider.notifier).increment();
              },
            ),
            AgeWeightWidget(
              cardWidth: cardWidth,
              title: "Age",
              value: age,
              onIncrement: () {
                ref.read(ageProvider.notifier).increment();
              },
              onDecrement: () {
                ref.read(ageProvider.notifier).decrement();
              },
            ),
          ]),
          Spacer(),
          GestureDetector(
            onTap: () {
              // calculate bmi
              // bmi = kg/m2
              // convert height cm to m
              final double heightInMeters = height / 100;
              final double bmi = weight / (heightInMeters * heightInMeters);
              print(bmi);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ResultScreen(bmi: bmi),
                ),
              );
            },
            child: Container(
              width: width,
              height: 60,
              color: Colors.pink,
              child: Center(child: Text("CALCULATE", style: titleTextStyle)),
            ),
          )
        ],
      ),
    );
  }
}
