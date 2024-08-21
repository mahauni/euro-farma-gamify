// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
                  (int e) => Container(
                    padding: EdgeInsets.only(top: 40, left: 60, right: 60),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: Text('Training $e'),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Icon(Icons.lock),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/training',
                            arguments: TrainingPageArguments(e));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(int e) {
    if (e == 1) {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: LinearProgressIndicator(),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Icon(Icons.lock),
      );
    }
  }
}
