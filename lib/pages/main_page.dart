// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../components/custom_card.dart';

class MainScreenArguments {
  final int id;
  final String name;

  MainScreenArguments(this.id, this.name);
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as MainScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page, Hello ${args.name}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              // <Widget>[

              // ]
            ],
          ),
          Expanded(
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
                        Navigator.pushNamed(context, '/training',
                            arguments: {args.id});
                      },
                      child: Text('Treinamento 1'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
