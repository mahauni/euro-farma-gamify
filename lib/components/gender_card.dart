// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_card.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String gender;

  const GenderCard({super.key, required this.icon, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 90,
                ),
                SizedBox(height: 15,),
                Text(
                  gender,
                  style: labelTextStyle,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
