// ignore_for_file: prefer_const_constructors

import 'package:euro_farma_gamify/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final int training;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key, required this.training, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        margin: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: activeCardColour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          hoverColor: activeCardColour,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          child: Text('Treinamento ${training.toString()}'),
        ),
      ),
    );
  }
}
