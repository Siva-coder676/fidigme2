import 'package:fidigame/Fidigame/fidigame.dart';
import 'package:fidigame/addgame/add_game.dart';
import 'package:fidigame/model/models.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  final _auth = FirebaseAuth.instance;

  void emptytoast() {
    if (_email.text.toString() == "" && _email.text.toString() != '@') {
      Toast.show("Enter a valid Email", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    } else if (_password.text.toString() == "" && _password.text.length < 3) {
      Toast.show("Enter a valid Password", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: new Container(
                height: 300,
                decoration: BoxDecoration(color: Color(0xffFCBC3C)),
                child: Center(
                    child: Text("Fidigames",
                        style: TextStyle(
                        fontFamily: 'Poppins',
                            fontSize: 32.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.black))),
              ),
            ),
            SizedBox(height: 30.0),
            new Center(
              child: Text("Log In",
                  style: TextStyle(
                        fontFamily: 'Poppins',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffFEFEFE))),
            ),
            SizedBox(height: 40.0),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              width: 330,
              height: 50.0,
              child: new TextFormField(
                style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xffFEFEFE)),
                controller: _email,
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle:TextStyle(
                        fontFamily: 'Poppins',color: Colors.white),
                  labelStyle:TextStyle(
                        fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffFEFEFE)),
                  filled: true,
                  fillColor: Color(0xff292333),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Color(0xff292333), width: 2.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xff292333)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              width: 330,
              height: 50.0,
              child: new TextFormField(
                 style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xffFEFEFE)),
                obscureText: true,
                controller: _password,
                onChanged: (value) {
                  password = value;
                },
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(
                        fontFamily: 'Poppins',color: Colors.white),
                  labelStyle:TextStyle(
                        fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffFEFEFE)),
                  filled: true,
                  fillColor: Color(0xff292333),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Color(0xff292333), width: 2.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xff292333)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(top: 37, left: 107, right: 107, bottom: 49),
                          child: Container(
                            width: 200,
                            height: 48,
                child: RaisedButton(
                  
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0xffFCBC3C))),
                  color: Color(0xffFCBC3C),
                  onPressed: () async {
                    emptytoast();
                    FirebaseLogin();
                    Navigator.push(context, MaterialPageRoute(
                      builder:(context)=>LoginPage()));
                   
                  },
                  child: Text("Sign In",
                      style:TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal)),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            new Center(
              child: Text("or sign in with",
                  style: TextStyle(
                        fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffFEFEFE))),
            ),
            SizedBox(height: 40.0),
            new Center(
              child: Text("New user? Sign In",
                  style: TextStyle(
                        fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffFEFEFE))),
            ),
            SizedBox(height: 70.0)
          ],
        ),
      ),
    );
  }
  
FirebaseLogin() async{
   try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (Context) => FidiGame()));
                    }
                  } catch (e) {
                    print(e.toString());
                  }

}

}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
