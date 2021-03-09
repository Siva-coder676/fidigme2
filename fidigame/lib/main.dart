import 'package:fidigame/Fidigame/fidigame.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyGame());
}
class MyGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Colors.black
      ),
      home: FidiGame(),
    );
  }
}

