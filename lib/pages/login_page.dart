// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  bool _denySpaces = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ListView(
                padding: EdgeInsets.all(10.0),
                shrinkWrap: true,
                children: [
                  Text("E-mail"),
                  TextField(
                    inputFormatters: [
                      if (_denySpaces)
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the email here",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Senha"),
                  TextField(
                    inputFormatters: [
                      if (_denySpaces)
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the email here",
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        iconSize: 20,
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: !_passwordVisible,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white10)),
                      onPressed: () {},
                      child: Text("Enter"),
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
