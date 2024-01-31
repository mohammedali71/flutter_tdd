import 'package:flutter/material.dart';
import 'dart:developer';
//import dart developer package to use the logging method

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final usernameTFController = TextEditingController();
  final passwordTFController = TextEditingController();
  //final usernameValidation = TextfieldValidation();

  @override
  void dispose() {
    usernameTFController.dispose(); //deletes both the username and password
    passwordTFController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText:
                        'Enter valid email id as abc@gmail.com'), //prompts the user
                key: const Key("username"), // collects the username
                controller: usernameTFController, //stores the username in this
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                key: const Key("password"),
                controller: passwordTFController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Log in'),
              onPressed: () {
                // ignore: unrelated_type_equality_checks
                if (TextfieldValidation.checkTextField == false) {
                  log('login unsuccessful');}
                else {log('login successful!');}
                }
            ),
            const SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}

//textfield validation 
class TextfieldValidation {
  bool checkTextField(String textToCheck, String type) {
    bool tfCheck = false;
    if (textToCheck.isNotEmpty) {
      if (type == "email") {
        tfCheck = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(textToCheck);
      }
    } else {
      tfCheck = false;
    }
    return tfCheck;
  }
}