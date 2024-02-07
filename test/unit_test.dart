import 'package:flutter/material.dart';
import 'package:flutter_tdd/textfield_validation.dart';
import 'package:flutter_tdd/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TextFieldValidation works correctly', () {
  //Arrange
  String email = "hello@gmail.com";
  final usernameTFController = TextEditingController();
  final usernameValidation = TextfieldValidation();
  String emailText = usernameTFController.text;
  //Act
  bool status = 
    usernameValidation.checkTextField(emailText, email)
  //Assert
  expect(usernameValidation, status = true);
  }
  );
}

