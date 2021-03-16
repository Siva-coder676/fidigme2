import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


  Widget Button1() {
    return GestureDetector(
      onTap: ()=>(
      print("button is tapped")
      ),
      child: new Container(
          width: 90,
          height: 34.0,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(20.0),
        topRight: const Radius.circular(20.0),
        bottomLeft: const Radius.circular(20.0),
        bottomRight: const Radius.circular(20.0)),
            boxShadow: [
      new BoxShadow(
        blurRadius: 1.0,
        color: Color(0xffFCBC3C),
      )
            ],
            border: Border.all(width: 2.5, color: Color(0xffFCBC3D)),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 7.0,bottom: 7.0,left: 18.0),
            child: Text(
      "2 Players",
      style:GoogleFonts.poppins(
        color: Color(0xff000000),
      fontStyle: FontStyle.normal,
      fontSize: 12.0

      )
       
    
            ),
          ),
        ),
    );
  }

  Widget Button2() {
    return GestureDetector(
      onTap: ()=>(

      print("button is tapped")
      ),
      child: new Container(
          width: 110,
          height: 34.0,
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
            padding: EdgeInsets.only(top: 7.0,bottom: 7.0,left: 20.0),
            child: Text(
      "3 -6 Players",
      style:GoogleFonts.poppins(
        color: Color(0xffEAE9EB),
      fontWeight: FontWeight.w500,
      fontSize: 12.0

      ) 
     
            ),
          ),
        ),
    );
  }

  Widget Button3() {
    return GestureDetector(
      onTap: ()=>(
      print("button is tapped")
      ),
      child: new Container(
          width: 140,
          height: 34.0,
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
            padding: EdgeInsets.only(top: 7.0,bottom: 7.0,left: 10.0),
            child: Text(
      "More than 6 Players",
      style:GoogleFonts.poppins(
        color: Color(0xffEAE9EB),
       fontWeight: FontWeight.w500,
      fontSize: 12.0

      ) 
  
      
            ),
          ),
        ),
    );
  }

