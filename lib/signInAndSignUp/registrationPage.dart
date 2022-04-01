// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:pylearn/Utils/testWidget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const iconPopButton()),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 160),
        child: Column(
          children: [
            Column(
              children: const [
                Text(
                  'Регистрация аккаунта',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const FormSignUpWidget(),
          ],
        ),
      ),
    );
  }
}

class FormSignUpWidget extends StatefulWidget {
  const FormSignUpWidget({Key? key}) : super(key: key);

  @override
  _FormSignUpWidget createState() => _FormSignUpWidget();
}

class _FormSignUpWidget extends State<FormSignUpWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future _signUp() async {
    FocusScope.of(context).unfocus();
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
          Navigator.pop(context);
        } on FirebaseAuthException catch (e) {
          final snackBar = SnackBar(
            content: Text(e.message.toString()),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg: "Нет подключения к интернету",
      );
    }
    setState(() {});
  }

  void dispos() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email!.isNotEmpty && !EmailValidator.validate(email)
                    ? 'Введите настаящую почту'
                    : null,
            controller: emailController,
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
            decoration: InputDecoration(
              hintText: 'Введите почту',
              hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: const Icon(Icons.mail, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value!.isNotEmpty && value.length < 8
                ? 'Минимальный пароль из 8 символов'
                : null,
            controller: passwordController,
            //obscureText: true,
            decoration: InputDecoration(
              hintText: 'Введите пароль',
              hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: const Icon(Icons.lock, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 45,
            width: 300,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: _signUp,
              child: Text(
                'Зарегестрироваться',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
