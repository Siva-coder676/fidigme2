import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fidigame/Firestore/firestore_service.dart';
import 'package:fidigame/addgame/add_game.dart';
import 'package:fidigame/loginpage/login.dart';
import 'package:fidigame/model/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FidiGame extends StatefulWidget {
  @override
  _FidiGameState createState() => _FidiGameState();
}

class _FidiGameState extends State<FidiGame> {
  int counter = 0;
  TextEditingController _controller = new TextEditingController();
  List<FidiData> gamelist;
  FireStoreService fireServ = new FireStoreService();
  StreamSubscription<QuerySnapshot> gameData;
  ScrollController _scrollController = new ScrollController();
  final _auth = FirebaseAuth.instance;
  bool isLiked = false;
  String PlayerSize;

  _selectPlayersize(String s) {
    setState(() {
      PlayerSize = s;
    });
  }

  pressed() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  _signOut() async {
    try {
      await _auth.signOut();

      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              fullscreenDialog: true, builder: (Context) => LoginPage()));
    } catch (e) {
      print(e.toString());
    }
  }

  FetchData() {
    gamelist = new List();
    gameData?.cancel();
    gameData = fireServ.getgameList().listen((QuerySnapshot snapshot) {
      final List<FidiData> newgame = snapshot.docs
          .map((DocumentSnapshot) => FidiData.fromMap(DocumentSnapshot.data()))
          .toList();
      setState(() {
        this.gamelist = newgame;
      });
    });
  }

  @override
  void initState() {
    PlayerSize = "2 Players";
    FetchData();
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "FidiGames",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20.0,
              color: Color(0xffFEFEFE),
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Row(
            children: [
              new IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text("Logout"),
                        content: new Text("Are you sure want to Exit ?"),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text("Yes"),
                            onPressed: () {
                              _signOut();
                            },
                          ),
                          new FlatButton(
                            child: new Text("No"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    },
                  );
                  print("Logout is done");
                },
                icon: Icon(Icons.logout),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: new Text(
                  "Logout",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
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
                        hintStyle: TextStyle(
                            fontFamily: 'Poppins',
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
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        Wrap(spacing: 10.0, children: [
                          ActionChip(
                              label: Text("2 Players"),
                              labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              backgroundColor: PlayerSize == "2 Players"
                                  ? Color(0xffFCBC3D)
                                  : Color(0xff292333),
                              onPressed: () =>
                                  (_selectPlayersize("2 Players"))),
                          ActionChip(
                              label: Text("3 - 6 Players"),
                              labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              backgroundColor: PlayerSize == "3 -6 Players"
                                  ? Color(0xffFCBC3D)
                                  : Color(0xff292333),
                              onPressed: () =>
                                  (_selectPlayersize("3 -6 Players"))),
                          ActionChip(
                              label: Text("More than 6 Players"),
                              labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              backgroundColor:
                                  PlayerSize == "More than 6 Players"
                                      ? Color(0xffFCBC3D)
                                      : Color(0xff292333),
                              onPressed: () =>
                                  (_selectPlayersize("More than 6 Players"))),
                        ])
                      ],
                    )),
                SizedBox(height: 20.0),
                Container(
                  child: Column(children: [
                    ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: gamelist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
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
                              border: Border.all(
                                  width: 2.5, color: Color(0xff292333)),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    SafeArea(
                                        child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: ListTile(
                                          leading: ClipRRect(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                            child: Image(
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.28,
                                              image: NetworkImage(
                                                  gamelist[index].image),
                                            ),
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.0, bottom: 15.0),
                                            child: Text(
                                                '${gamelist[index].name}',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18.0,
                                                    color: Color(0xffFFFFFF))),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            child: Text(
                                              '${gamelist[index].Desc}',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10.0,
                                                  color: Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle: FontStyle.normal),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                pressed();
                                                if (isLiked) {
                                                  FirebaseFirestore.instance
                                                      .collection("likes")
                                                      .doc()
                                                      .set(
                                                          {
                                                        "likes": FieldValue
                                                            .increment(1)
                                                      },
                                                          SetOptions(
                                                              merge:
                                                                  true)).then(
                                                          (_) {
                                                    setState(() {
                                                      counter++;
                                                    });
                                                  }).catchError((e) {
                                                    print(e.toString());
                                                  });
                                                } else {
                                                  FirebaseFirestore.instance
                                                      .collection("unlikes")
                                                      .doc()
                                                      .set(
                                                          {
                                                        "likes": FieldValue
                                                            .increment(-1)
                                                      },
                                                          SetOptions(
                                                              merge:
                                                                  true)).then(
                                                          (_) {
                                                    setState(() {
                                                      //counter--;
                                                    });
                                                  });
                                                }
                                              },
                                              child: Container(
                                                  width: 11.08,
                                                  height: 10.09,
                                                  child: isLiked
                                                      ? Image.asset(
                                                          "assets/like.png")
                                                      : Image.asset(
                                                          "assets/likes.png")),
                                            ),
                                            SizedBox(
                                              width: 2.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: new Text(('$counter'),
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FontStyle.normal,
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
                                                  topLeft:
                                                      const Radius.circular(
                                                          16.0),
                                                  topRight:
                                                      const Radius.circular(
                                                          16.0),
                                                  bottomLeft:
                                                      const Radius.circular(
                                                          16.0),
                                                  bottomRight:
                                                      const Radius.circular(
                                                          16.0)),
                                              boxShadow: [
                                                new BoxShadow(
                                                  //blurRadius: 1.0,
                                                  color: Colors.black,
                                                )
                                              ],
                                              border: Border.all(
                                                  color: Color(0xffFCBC3D)),
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
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xffFFFFFF),
                                                      fontStyle:
                                                          FontStyle.normal,
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
                                                image: AssetImage(
                                                    'assets/user.png'),
                                              ),
                                            ),
                                            SizedBox(width: 2.0),
                                            new Text(
                                                '${gamelist[index].Minicount} -',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                            SizedBox(height: 5.0),
                                            new Text(
                                                '${gamelist[index].Maxcount} Players',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: 20.0),
                  ]),
                ),
              ],
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>
                              AddGame(FidiData('', '', '', '', '', ''))));
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
                          style: TextStyle(
                            fontFamily: 'Poppins',
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
            SizedBox(height: 40.0)
          ],
        ),
      ),
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
