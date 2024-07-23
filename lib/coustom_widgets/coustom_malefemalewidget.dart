import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaleFemale extends StatelessWidget {
  const MaleFemale({
    super.key,
    required this.cardWidth,
    required this.isMale,
  });

  final double cardWidth;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardWidth,
      width: cardWidth,
      decoration: cardDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // use of ternary operator
          FaIcon(isMale?FontAwesomeIcons.mars:FontAwesomeIcons.venus,size: 30 ,color: Colors.white,),
          Text(
            isMale?"Male":"Female", 
            style: descStyle,
          )
        ],
      ),
    );
  }
}