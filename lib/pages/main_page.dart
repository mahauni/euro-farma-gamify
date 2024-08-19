// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:euro_farma_gamify/components/custom_button.dart';
import 'package:euro_farma_gamify/pages/training_page.dart';
import 'package:flutter/material.dart';

class MainPageArguments {
  final int id;
  final String name;

  MainPageArguments(this.id, this.name);
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final trainings = [1, 2, 3, 4];
    final args =
        ModalRoute.of(context)?.settings.arguments as MainPageArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page, Hello ${args.name}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ...trainings.map<Widget>(
                  (int e) => Row(
                    children: [
                      CustomButton(
                        training: e,
                        onPressed: () {
                          Navigator.pushNamed(context, '/training',
                              arguments: TrainingPageArguments(e));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
