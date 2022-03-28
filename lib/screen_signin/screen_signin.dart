import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:settyl/root/roor.dart';
import 'package:settyl/screen_guest/screen_guest.dart';
import 'package:firebase_core/firebase_core.dart';

final _username = TextEditingController();
final _password = TextEditingController();

class SigninScreen extends StatefulWidget {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formkey = GlobalKey<FormState>();

  void sign(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _username.text, password: _password.text)
        .catchError((onError) {
      print(onError);
    }).then((authuser) {
      print(authuser.user!.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Container(
              // decoration: BoxDecoration(border: Border.all(color: Colors.purple)),
              width: double.infinity,
              height: 400,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent[200],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(),
                      ),
                      validator: (_) {
                        if (_username.text.isEmpty) {
                          return "Username is empty";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      validator: (_) {
                        if (_password.text.isEmpty) {
                          return "Password is empty";
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          checklogin(context);
                          _formkey.currentState!.save();
                          sign(context);
                        }
                      },
                      child: Text("Sign In")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => GuestScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text("Skip"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void checklogin(BuildContext context) {
  final _usernamel = _username.text;
  final _passwordl = _password.text;
  if (_usernamel == _passwordl &&
      _usernamel.isNotEmpty &&
      _passwordl.isNotEmpty) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => Root()), (route) => false);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(15),
        content: Text("Uesername & Password Does not match"),
      ),
    );
  }
}
