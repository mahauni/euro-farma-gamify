// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:euro_farma_gamify/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  final bool _denySpaces = false;
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

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
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  children: [
                    Text("E-mail"),
                    TextFormField(
                      onSaved: (value) {
                        email = value!;
                      },
                      inputFormatters: [
                        if (_denySpaces)
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Plese enter a email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter the email here",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Senha"),
                    TextFormField(
                      onSaved: (value) {
                        password = value!;
                      },
                      inputFormatters: [
                        if (_denySpaces)
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Plese enter a password";
                        }
                        return null;
                      },
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
                                WidgetStateProperty.all<Color>(Colors.white10)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // save all the values in the variables
                            _formKey.currentState!.save();

                            // test if the form is validated
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );

                            Navigator.pushReplacementNamed(
                              context,
                              '/main',
                              arguments: MainPageArguments(
                                1, // id
                                "Lucas Raoni", // name
                              ),
                            );
                          }
                        },
                        child: Text("Enter"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
