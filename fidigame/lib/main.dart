import 'package:fidigame/AddGame/add_game.dart';
import 'package:fidigame/DataModel/models.dart';
import 'package:fidigame/Fidigame/fidigame.dart';
import 'package:fidigame/LoginPage/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyGame());
}

class MyGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: FidiGame(),
    );
  }
}
