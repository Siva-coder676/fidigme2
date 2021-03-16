import 'package:fidigame/Fidigame/fidigame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGame extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;
  AddGame({Key key, this.minValue = 2, this.maxValue = 8, this.onChanged})
      : super(key: key);
  @override
  _AddGameState createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  int counter = 0;
  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
          elevation: 0.0,
          leading: IconButton(
              icon: Image.asset(
                "assets/arrowleft.png",
                width: 9,
                height: 16,
              ),
              onPressed: () {}),
          title: Text("Add a Game",
              style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFEFEFE)))),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              new Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 29, left: 28),
                    child: new Text("Name of the Game",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            color: Color(0xffFEFEFE))),
                  ),
                ],
              ),
              new Container(
                margin: EdgeInsets.only(
                    top: 5.0, bottom: 8.0, left: 24.0, right: 16.0),
                width: double.maxFinite,
                height: 48.0,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8.0),
                      topRight: const Radius.circular(8.0),
                      bottomLeft: const Radius.circular(8.0),
                      bottomRight: const Radius.circular(8.0)),
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
                  padding: EdgeInsets.only(left: 16.0, top: 13.0, bottom: 10.0),
                  child: Text("Among Us",
                      style: GoogleFonts.poppins(
                          color: Color(0xffFEFEFE),
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 29, left: 28),
                    child: new Text("Description",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            color: Color(0xffFEFEFE))),
                  )
                ],
              ),
              new Container(
                margin: EdgeInsets.only(
                    top: 5.0, bottom: 8.0, left: 24.0, right: 16.0),
                width: double.maxFinite,
                height: 120,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8.0),
                      topRight: const Radius.circular(8.0),
                      bottomLeft: const Radius.circular(8.0),
                      bottomRight: const Radius.circular(8.0)),
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
                  padding: EdgeInsets.only(
                      left: 16.0, top: 12.0, bottom: 50.0, right: 31.0),
                  child: Text(
                      "Join your crewmates in a multiplayer game of teamwork .",
                      style: GoogleFonts.poppins(
                          color: Color(0xffFEFEFE),
                          fontSize: 14.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              new Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28, top: 33, bottom: 5.0),
                    child: new Text("Game URL",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            color: Color(0xffFEFEFE))),
                  ),
                ],
              ),
              new Container(
                margin: EdgeInsets.only(
                    top: 5.0, bottom: 8.0, left: 24.0, right: 16.0),
                width: double.maxFinite,
                height: 47.0,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8.0),
                      topRight: const Radius.circular(8.0),
                      bottomLeft: const Radius.circular(8.0),
                      bottomRight: const Radius.circular(8.0)),
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
                  padding: EdgeInsets.only(left: 16.0, top: 13.0, bottom: 10.0),
                  child: Text("www.amongus.com",
                      style: GoogleFonts.poppins(
                          color: Color(0xffFEFEFE),
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              new Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 28.0, top: 36.0, bottom: 8.0, right: 144.0),
                    child: new Text("Players Count",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            color: Color(0xffFEFEFE))),
                  ),
                ],
              ),
              Container(
                width: double.maxFinite,
                //color: Colors.green,
                child: new Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: new Text("Minimum Count",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              color: Color(0xffFEFEFE))),
                    ),
                    SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {},
                      child: new Container(
                        width: 34,
                        height: 34,
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
                          border:
                              Border.all(width: 2.5, color: Color(0xff292333)),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 5.0, top: 3.0, bottom: 3.0),
                            child: Text('2',
                                style: GoogleFonts.poppins(
                                    color: Color(0xffFEFEFE),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: new Text("Maximum Count",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              color: Color(0xffFEFEFE))),
                    ),
                    SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {},
                      child: new Container(
                        width: 34,
                        height: 34,
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
                          border:
                              Border.all(width: 2.5, color: Color(0xff292333)),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 3.0, top: 3.0, bottom: 5.0),
                          child: Text('8',
                              style: GoogleFonts.poppins(
                                  color: Color(0xffFEFEFE),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 24.0, right: 148, bottom: 5.0, top: 49),
                    child: new Text("Category",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            color: Color(0xffFEFEFE))),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 23, top: 5.0, right: 16.0),
                width: double.maxFinite,
                height: 48.0,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8.0),
                      topRight: const Radius.circular(8.0),
                      bottomLeft: const Radius.circular(8.0),
                      bottomRight: const Radius.circular(8.0)),
                  boxShadow: [
                    new BoxShadow(
                      blurRadius: 1.0,
                      color: Color(0xff292333),
                    )
                  ],
                  border: Border.all(width: 2.5, color: Color(0xff292333)),
                  shape: BoxShape.rectangle,
                ),
                child: DropdownButton(
                  icon: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 12.0,
                    height: 6.0,
                    child: ClipRRect(
                      child: Image.asset("assets/vector.png"),
                    ),
                  ),
                  hint: _dropDownValue == null
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, top: 13.0, bottom: 10.0),
                          child: Text('Choose the category of game',
                              style: GoogleFonts.poppins(
                                  color: Color(0xffFEFEFE),
                                  fontSize: 14.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400)),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, top: 13.0, bottom: 10.0),
                          child: Text(_dropDownValue,
                              style: GoogleFonts.poppins(
                                  color: Color(0xffFEFEFE),
                                  fontSize: 14.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400)),
                        ),
                  isExpanded: true,
                  // iconSize: 30.0,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  items: ['Among Us', 'Mini Militia', 'Skribble.io'].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val,
                            style: GoogleFonts.poppins(color: Colors.black)),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownValue = val;
                      },
                    );
                  },
                  underline: Container(
                      height: 1.0,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.transparent, width: 0.0)))),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: 41.0, left: 24.0, right: 16.0),
                width: double.maxFinite,
                height: 48.0,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(8.0),
                      topRight: const Radius.circular(8.0),
                      bottomLeft: const Radius.circular(8.0),
                      bottomRight: const Radius.circular(8.0)),
                  boxShadow: [
                    new BoxShadow(
                      blurRadius: 1.0,
                      color: Color(0xff292333),
                    )
                  ],
                  border: Border.all(width: 2.5, color: Color(0xff292333)),
                  shape: BoxShape.rectangle,
                ),
                child: Container(
                  child: Row(children: [
                    IconButton(
                      icon: Container(
                          child: ClipRRect(
                        child: new Image.asset(
                          "assets/Upload.png",
                          width: 30,
                          height: 10,
                        ),
                      )),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                    Text("Upload an image",
                        style: GoogleFonts.poppins(
                            color: Color(0xffFEFEFE),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal)),
                  ]),
                ),
              ),
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
                  onPressed: () {},
                  child: Text("Submit",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}