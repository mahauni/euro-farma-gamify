// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:euro_farma_gamify/components/custom_button.dart';
import 'package:euro_farma_gamify/pages/handout_page.dart';
import 'package:flutter/material.dart';

class TrainingPageArguments {
  final int trainingId;

  TrainingPageArguments(this.trainingId);
}

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as TrainingPageArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Treinamento ${args.trainingId}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, '/quiz');
            },
            child: Text('Quiz'),
          )),
          Expanded(
            child: CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/handout',
                    arguments: HandoutPageArguments(args.trainingId));
              },
              child: Text('Apostilas'),
            ),
          ),
        ],
      ),
    );
  }
}
