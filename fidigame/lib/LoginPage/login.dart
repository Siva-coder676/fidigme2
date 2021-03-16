import 'package:fidigame/Fidigame/fidigame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
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
                        style: GoogleFonts.poppins(
                            fontSize: 32.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.black))),
              ),
            ),
            SizedBox(height: 30.0),
            new Center(
              child: Text("Log In",
                  style: GoogleFonts.poppins(
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
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0)),
                boxShadow: [
                  new BoxShadow(
                    blurRadius: 1.0,
                    color: Color(0xff292333),
                  )
                ],
                border: Border.all(width: 2.5, color: Color(0xff292333)),
                shape: BoxShape.rectangle,
              ),
              child: new TextFormField(
                style: GoogleFonts.poppins(color: Color(0xffFEFEFE)),
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.only(left: 5.0),
                  hintStyle: GoogleFonts.poppins(color: Colors.white),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffFEFEFE)),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              width: 330,
              height: 50.0,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0)),
                boxShadow: [
                  new BoxShadow(
                    blurRadius: 1.0,
                    color: Color(0xff292333),
                  )
                ],
                border: Border.all(width: 2.5, color: Color(0xff292333)),
                shape: BoxShape.rectangle,
              ),
              child: new TextFormField(
                obscureText: true,
                style: GoogleFonts.poppins(color: Color(0xffFEFEFE)),
                controller: _password,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.only(left: 5.0),
                  hintStyle: GoogleFonts.poppins(color: Colors.white),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffFEFEFE)),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin:
                  EdgeInsets.only(top: 37, left: 107, right: 107, bottom: 49),
              width: 200,
              height: 48,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(color: Color(0xffFCBC3C))),
                color: Color(0xffFCBC3C),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (Context) => FidiGame()));
                },
                child: Text("Sign In",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal)),
              ),
            ),
            SizedBox(height: 30.0),
            new Center(
              child: Text("or sign in with",
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Color(0xffFEFEFE))),
            ),
            SizedBox(height: 40.0),
            new Center(
              child: Text("New user? Sign In",
                  style: GoogleFonts.poppins(
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
