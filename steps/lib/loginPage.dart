import 'package:flutter/material.dart';
import 'package:steps/signUp.dart';
import 'package:steps/eventsPage.dart';
//Code for login page
class loginPage extends StatefulWidget {
  const loginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
            onPressed: () {Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => eventsPage(title: "Sign Up Page")));},
            child: Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpPage(title: "Sign Up Page")));
            },
            child: Text("Create New Account"),
          )
        ]));
  }
}
