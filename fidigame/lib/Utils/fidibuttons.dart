import 'package:flutter/material.dart';

class FidiButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button1("2 Players",context),
        Button2("3-6 Players"),
        Button3("More than 6 Players")
      ],
    );
  }

  Widget Button1(String text,BuildContext context) {
    return GestureDetector(
      onTap: ()=>(
      print("button is tapped")
      ),
      child: new Container(
        width: 90,
        height: 30.0,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
              bottomLeft: const Radius.circular(20.0),
              bottomRight: const Radius.circular(20.0)),
          boxShadow: [
            new BoxShadow(
              blurRadius: 1.0,
              color: Color(0xffFCBC3D),
            )
          ],
          border: Border.all(width: 2.5, color: Color(0xffFCBC3D)),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Text(
            text,
            style: new TextStyle(color: Color(0xffEAE9EB)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget Button2(String text) {
    return GestureDetector(
      onTap: ()=>(

      print("button is tapped")
      ),
      child: new Container(
        width: 110,
        height: 30.0,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
              bottomLeft: const Radius.circular(20.0),
              bottomRight: const Radius.circular(20.0)),
          boxShadow: [
            new BoxShadow(
              blurRadius: 1.0,
              color: Color(0xff292333),
            )
          ],
          border: Border.all(width: 2.5, color: Color(0xff292333)),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Text(
            text,
            style: new TextStyle(color: Color(0xffEAE9EB)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget Button3(String text) {
    return GestureDetector(
      onTap: ()=>(
      print("button is tapped")
      ),
      child: new Container(
        width: 140,
        height: 30.0,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
              bottomLeft: const Radius.circular(15.0),
              bottomRight: const Radius.circular(15.0)),
          boxShadow: [
            new BoxShadow(
              blurRadius: 1.0,
              color: Color(0xff292333),
            )
          ],
          border: Border.all(width: 2.5, color: Color(0xff292333)),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Text(
            text,
            style: new TextStyle(color: Color(0xffEAE9EB)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
