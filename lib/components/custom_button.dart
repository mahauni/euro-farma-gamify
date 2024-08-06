// ignore_for_file: prefer_const_constructors

import 'package:euro_farma_gamify/components/custom_card.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;

  const CustomButton({super.key, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/training', arguments: {});
                },
                child: Text('Treinamento 1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
