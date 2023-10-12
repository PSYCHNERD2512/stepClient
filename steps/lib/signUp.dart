import 'package:flutter/material.dart';
import 'package:steps/loginPage.dart';

//Code for Sign Up page
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          TextField(),
          TextField(),
          TextButton(
            onPressed: () {},
            child: Text("Sign Up"),
          ),

        ]));
  }
}
