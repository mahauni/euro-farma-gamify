// ignore_for_file: prefer_const_constructors

import 'package:euro_farma_gamify/components/custom_card.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final int training;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key, required this.training, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                onPressed: onPressed,
                child: Text('Treinamento ${training.toString()}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
