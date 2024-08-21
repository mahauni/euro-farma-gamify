// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HandoutPageArguments {
  final int trainingId;

  HandoutPageArguments(this.trainingId);
}

class HandoutPage extends StatefulWidget {
  const HandoutPage({super.key});

  @override
  State<HandoutPage> createState() => _HandoutPageState();
}

class _HandoutPageState extends State<HandoutPage> {
  @override
  Widget build(BuildContext context) {
    final trainings = [1, 2, 3, 4];
    final args =
        ModalRoute.of(context)?.settings.arguments as HandoutPageArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Apostilas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 30.0),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ...trainings.map<Widget>(
                  (int e) => Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: TextButton.icon(
                      onPressed: () {},
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.download_sharp),
                      label: Text(
                        'Apostila $e',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
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
