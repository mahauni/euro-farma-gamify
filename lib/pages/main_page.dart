// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../components/custom_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context)?.settings.arguments; way to receive the arguments
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomCard(),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Quiz"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: CustomCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
