import 'package:fidigame/AddGame/add_game.dart';
import 'package:fidigame/Utils/fidibuttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FidiGame extends StatefulWidget {
  @override
  _FidiGameState createState() => _FidiGameState();
}

class _FidiGameState extends State<FidiGame> {
  TextEditingController _controller = new TextEditingController();
  //List<FidiData> GameList = new List();
  @override
  void initState() {
    //creategameList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "FidiGames",
            style: GoogleFonts.poppins(
                fontSize: 20.0,
                color: Color(0xffFEFEFE),
                fontWeight: FontWeight.w600),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: new Container(
                  width: 369,
                  height: 45.0,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        topRight: const Radius.circular(16.0),
                        bottomLeft: const Radius.circular(16.0),
                        bottomRight: const Radius.circular(16.0)),
                    boxShadow: [
                      new BoxShadow(
                        blurRadius: 1.0,
                        color: Color(0xff292333),
                      )
                    ],
                    border: Border.all(width: 2.5, color: Color(0xff292333)),
                    shape: BoxShape.rectangle,
                  ),
                  child: new TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: 'Search',
                      contentPadding: EdgeInsets.only(top: 4.0, bottom: 3.0),
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 34,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    //shrinkWrap: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      Wrap(spacing: 6.0, children: [
                        Button1(),
                        SizedBox(width: 2.0),
                        Button2(),
                        SizedBox(width: 2.0),
                        Button3()
                      ])
                    ],
                  )),
              SizedBox(height: 10.0),
              new Column(
                children: [
                  ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        AmongUs(),
                        SizedBox(
                          height: 8.0,
                        ),
                        Minimilitia(),
                        SizedBox(height: 18.0),
                        Skribble(),
                        SizedBox(height: 18.0),
                        Skribble(),
                      ]),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 200,
                height: 48,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0xffFCBC3C))),
                  color: Color(0xffFCBC3C),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         fullscreenDialog: true,
                    //         builder: (context) => AddGame()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 14, bottom: 13.0, left: 40),
                    child: Row(
                      children: [
                        new Text(
                          "+",
                          style: new TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text("Add Game",
                            style: GoogleFonts.poppins(
                              color: Color(0xff000000),
                              fontSize: 14.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget AmongUs() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(8.0),
            width: double.maxFinite,
            height: 148,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0),
                  bottomLeft: const Radius.circular(16.0),
                  bottomRight: const Radius.circular(16.0)),
              boxShadow: [
                new BoxShadow(
                  blurRadius: 1.0,
                  color: Color(0xff292333),
                )
              ],
              border: Border.all(width: 2.5, color: Color(0xff292333)),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                SafeArea(
                    child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/amongus.jpg'),
                          ),
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                          child: Text("Among Us",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0,
                                  color: Color(0xffFFFFFF))),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Join your crewmates in a multiplayer game of teamwork",
                            style: GoogleFonts.poppins(
                                fontSize: 10.0,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                              width: 11.08,
                              height: 10.09,
                              child: Image.asset("assets/like.png")),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: new Text("240",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0)),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => (openUrl()),
                      child: new Container(
                        width: 88,
                        height: 32.0,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16.0),
                              topRight: const Radius.circular(16.0),
                              bottomLeft: const Radius.circular(16.0),
                              bottomRight: const Radius.circular(16.0)),
                          boxShadow: [
                            new BoxShadow(
                              //blurRadius: 1.0,
                              color: Colors.black,
                            )
                          ],
                          border: Border.all(color: Color(0xffFCBC3D)),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.play_arrow,
                              color: Color(0xffFFFFFF),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Play",
                              style: GoogleFonts.poppins(
                                  color: Color(0xffFFFFFF),
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Row(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/user.png'),
                          ),
                        ),
                        SizedBox(width: 2.0),
                        new Text("4 - 6 Players",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300))
                      ],
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }

  Widget Minimilitia() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          width: double.maxFinite,
          height: 148,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16.0),
                topRight: const Radius.circular(16.0),
                bottomLeft: const Radius.circular(16.0),
                bottomRight: const Radius.circular(16.0)),
            boxShadow: [
              new BoxShadow(
                blurRadius: 1.0,
                color: Color(0xff292333),
              )
            ],
            border: Border.all(width: 2.5, color: Color(0xff292333)),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: [
              SafeArea(
                  child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/minimiltia.jpg'),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                        child: Text("Mini Militia",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0,
                                color: Color(0xffFFFFFF))),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          "Join your crewmates in a multiplayer game of teamwork",
                          style: GoogleFonts.poppins(
                              fontSize: 10.0,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                            width: 11.08,
                            height: 10.09,
                            child: Image.asset("assets/likes.png")),
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: new Text("240",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0)),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () => (openMini()),
                    child: new Container(
                      width: 88,
                      height: 32.0,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16.0),
                            topRight: const Radius.circular(16.0),
                            bottomLeft: const Radius.circular(16.0),
                            bottomRight: const Radius.circular(16.0)),
                        boxShadow: [
                          new BoxShadow(
                            //blurRadius: 1.0,
                            color: Colors.black,
                          )
                        ],
                        border: Border.all(color: Color(0xffFCBC3D)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.play_arrow,
                            color: Color(0xffFFFFFF),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "Play",
                            style: GoogleFonts.poppins(
                                color: Color(0xffFFFFFF),
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Row(
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/user.png'),
                        ),
                      ),
                      SizedBox(width: 2.0),
                      new Text(
                        "4 - 6 Players",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget Skribble() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            width: double.maxFinite,
            height: 148,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0),
                  bottomLeft: const Radius.circular(16.0),
                  bottomRight: const Radius.circular(16.0)),
              boxShadow: [
                new BoxShadow(
                  blurRadius: 1.0,
                  color: Color(0xff292333),
                )
              ],
              border: Border.all(width: 2.5, color: Color(0xff292333)),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                SafeArea(
                    child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/skribble.jpg'),
                          ),
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                          child: Text("Skribble.io",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0,
                                  color: Color(0xffFFFFFF))),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Join your crewmates in a multiplayer game of teamwork",
                            style: GoogleFonts.poppins(
                                fontSize: 10.0,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                              width: 11.08,
                              height: 10.09,
                              child: Image.asset("assets/likes.png")),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: new Text("240",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0)),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => (openSkribble()),
                      child: new Container(
                        width: 88,
                        height: 32.0,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16.0),
                              topRight: const Radius.circular(16.0),
                              bottomLeft: const Radius.circular(16.0),
                              bottomRight: const Radius.circular(16.0)),
                          boxShadow: [
                            new BoxShadow(
                              //blurRadius: 1.0,
                              color: Colors.black,
                            )
                          ],
                          border: Border.all(color: Color(0xffFCBC3D)),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.play_arrow,
                              color: Color(0xffFFFFFF),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Play",
                              style: GoogleFonts.poppins(
                                  color: Color(0xffFFFFFF),
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Row(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/user.png'),
                          ),
                        ),
                        SizedBox(width: 2.0),
                        new Text(
                          "4 - 6 Players",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }

  openUrl() async {
    if (await canLaunch("https://innersloth.com")) {
      await launch("https://innersloth.com");
    } else {
      throw 'Could not Launch Url';
    }
  }

  openMini() async {
    if (await canLaunch("https://www.minimilitia.mobi")) {
      await launch("https://www.minimilitia.mobi");
    } else {
      throw 'Could not Launch Url';
    }
  }

  openSkribble() async {
    if (await canLaunch("https://skribbl.io")) {
      await launch("https://skribbl.io");
    } else {
      throw 'Could not Launch Url';
    }
  }
}
