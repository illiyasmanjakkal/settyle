import 'package:flutter/material.dart';
import 'package:settyl/screen_guest/screen_guest.dart';
import 'package:settyl/screen_signin/screen_signin.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent[200],
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => SigninScreen()));
                  },
                  child: Text("Next"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
