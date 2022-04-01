// ignore_for_file: file_names

import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pylearn/Utils/testWidget.dart';

import 'loginPage.dart';

class FormResetPasswordWidget extends StatefulWidget {
  const FormResetPasswordWidget({Key? key}) : super(key: key);

  @override
  _FormResetPasswordWidget createState() => _FormResetPasswordWidget();
}

class _FormResetPasswordWidget extends State<FormResetPasswordWidget> {
  final emailController = TextEditingController();
  Future _resetPassword() async {
    FocusScope.of(context).unfocus();
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: emailController.text.trim());
          const text =
              'На указанную почту было отправлена ссылка на сброс пароля';
          const snackBar = SnackBar(
            content: Text(text),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          FirebaseAuth.instance.signOut();
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        } on FirebaseAuthException catch (e) {
          final snackBar = SnackBar(
            content: Text(e.message.toString()),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
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
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Сброс пароля',
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText2?.color)),
        leading: const iconPopButton(),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 235),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Вы получите электроное письмо для сброса пароля',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email!.isNotEmpty && !EmailValidator.validate(email)
                        ? 'Введите настаящую почту'
                        : null,
                controller: emailController,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2!.color),
                decoration: InputDecoration(
                  labelStyle: const TextStyle(fontSize: 18),
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
                  onPressed: _resetPassword,
                  child: Text(
                    'Сбросить пароль',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyText2?.color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
