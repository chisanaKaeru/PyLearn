// ignore_for_file: deprecated_member_use, empty_catches, file_names

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pylearn/Utils/realTimeDatabase.dart';
import 'dart:io';

import 'registrationPage.dart';
import 'resetPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 220),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Добро пожаловать\nв приложение PyLearn!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 15),
              FormSignInWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormSignInWidget extends StatefulWidget {
  const FormSignInWidget({Key? key}) : super(key: key);

  @override
  _FormSignInWidget createState() => _FormSignInWidget();
}

class _FormSignInWidget extends State<FormSignInWidget> {
  var icon = const Icon(Icons.visibility_off, color: Colors.white);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isHidePassword = true;
  void _togglePasswordView() {
    isHidePassword = !isHidePassword;
    icon = isHidePassword == true
        ? const Icon(Icons.visibility_off, color: Colors.white)
        : const Icon(Icons.visibility, color: Colors.white);
    setState(() {});
  }

  Future _signIn() async {
    FocusScope.of(context).unfocus();
    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
        } on FirebaseAuthException catch (e) {
          final snackBar = SnackBar(
            content: Text(e.message.toString()),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "Нет подключения к интернету");
    }
    setState(() {});
  }

  void dispos() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const FormResetPasswordWidget()));
    setState(() {});
  }

  void _registrationPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegistrationPage()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) =>
              email!.isNotEmpty && !EmailValidator.validate(email)
                  ? 'Введите настаящую почту'
                  : null,
          controller: emailController,
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
          decoration: InputDecoration(
            hintText: 'Введите почту',
            hintStyle:
                TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value!.isNotEmpty && value.length < 8
              ? 'Минимальный пароль из 8 символов'
              : null,
          controller: passwordController,
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
          obscureText: isHidePassword,
          decoration: InputDecoration(
            hintText: 'Введите пароль',
            hintStyle:
                TextStyle(color: Theme.of(context).textTheme.bodyText2!.color),
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
            suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: _togglePasswordView,
              child: icon,
            ),
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
            onPressed: _signIn,
            child: Text(
              'Войти',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyText2?.color),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Нет аккаунта?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: _registrationPage,
              child: Text(
                'Зарегестрироваться!',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: _resetPassword,
          child: Text(
            'Забыли пароль?',
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }
}
