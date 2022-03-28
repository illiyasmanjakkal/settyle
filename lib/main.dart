import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settyl/screen_welcome/screen_welcome.dart';

// NR1DwoGUiHUip0l1RrDftTqS0Qh2
void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: WelcomeScreen(),
    );
  }
}
