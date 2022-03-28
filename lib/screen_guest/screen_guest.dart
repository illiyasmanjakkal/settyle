import 'package:flutter/material.dart';
import 'package:settyl/screen_signin/screen_signin.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome as Guest"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => SigninScreen()));
            },
            child: Text(
              "Sign In",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Welcome to Guest Screen"),
        ),
      ),
    );
  }
}
