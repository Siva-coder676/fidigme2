import 'package:fidigame/Fidigame/fidi_reusable_widget.dart';
import 'package:fidigame/Model/fidi_model.dart';
import 'package:fidigame/Utils/fidibuttons.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(elevation: 0.0, title: Text("FidiGames")),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: new Container(
                  width: 300,
                  height: 40.0,
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
                  child: new TextField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: 'Search',
                      hintStyle: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: 'vgarounded',
                          fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: double.maxFinite,
                height: 60,
                child: FidiButton(),
              ),
              SizedBox(height: 10.0),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: double.maxFinite,
                    height: 150,
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
                      border:
                          Border.all(width: 2.5, color: Color(0xff292333)),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        SafeArea(
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                  child: ListTile(
                                    leading: Image.asset("assets/amongus.jpg"),
                                    title: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        "Among Us",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                    subtitle: Text(
                                      " Join your crewmates in a multiplayer game of teamwork",
                                      style: new TextStyle(
                                          fontSize: 12.0, color: Colors.white),
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: new Container(
                            margin: EdgeInsets.all(2.0),
                            width: double.infinity,
                            height: 40,
                            // color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      child:  Image.asset("assets/like.jpg"),
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: new Text("240",style: new TextStyle(
                                          color: Colors.white
                                      ),),
                                    )
                                  ],
                                ),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.play_arrow),
                                  label: Text("Play"),
                                  onPressed: () => print("it's pressed"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 15.0,
                                          color: Color(0xffFCBC3D)
                                      ),
                                      borderRadius: BorderRadius.circular(32.0),

                                    ),
                                  ),

                                ),

                                new Row(
                                  children: [
                                    Icon(Icons.person_sharp,color: Colors.white,),
                                    new Text("4-6 Players",style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )

                      ],
                    )
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: double.maxFinite,
                    height: 150,
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
                      border:
                          Border.all(width: 2.5,
                              color: Color(0xff292333)
                          ),
                     shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        SafeArea(
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                  child: ListTile(
                                    leading: Image.asset("assets/minimiltia.jpg"),
                                    title: Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        "Mini Militia",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                    subtitle: Text(
                                      " Join your crewmates in a multiplayer game of teamwork",
                                      style: new TextStyle(
                                          fontSize: 12.0, color: Colors.white),
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: new Container(
                            margin: EdgeInsets.all(2.0),
                            width: double.infinity,
                            height: 40,
                           // color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      child:  Image.asset("assets/like.jpg"),
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: new Text("240",style: new TextStyle(
                                        color: Colors.white
                                      ),),
                                    )
                                  ],
                                ),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.play_arrow),
                                  label: Text("Play"),
                                  onPressed: () => print("it's pressed"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 15.0,
                                        color: Color(0xffFCBC3D)
                                      ),
                                      borderRadius: BorderRadius.circular(32.0),

                                    ),
                                  ),

                                ),

                                new Row(
                                  children: [
                                    Icon(Icons.person_sharp,color: Colors.white,),
                                    new Text("4-6 Players",style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100
                                    ),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],

                    ),

                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: double.maxFinite,
                    height: 150,
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
                      border:
                          Border.all(width: 2.5, color: Color(0xff292333)),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: [
                        SafeArea(
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                  child: ListTile(
                                    leading: Image.asset("assets/skribble.jpg"),
                                    title: Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        "Skribble.io",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                    subtitle: Text(
                                      " Join your crewmates in a multiplayer game of teamwork",
                                      style: new TextStyle(
                                          fontSize: 12.0, color: Colors.white),
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: new Container(
                            margin: EdgeInsets.all(2.0),
                            width: double.infinity,
                            height: 40,
                            // color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      child:  Image.asset("assets/like.jpg"),
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: new Text("240",style: new TextStyle(
                                          color: Colors.white
                                      ),),
                                    )
                                  ],
                                ),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.play_arrow),
                                  label: Text("Play"),
                                  onPressed: () => print("it's pressed"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 15.0,
                                          color: Color(0xffFCBC3D)
                                      ),
                                      borderRadius: BorderRadius.circular(32.0),

                                    ),
                                  ),

                                ),

                                new Row(
                                  children: [
                                    Icon(Icons.person_sharp,color: Colors.white,),
                                    new Text("4-6 Players",style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )

                      ],
                    )
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      width: double.maxFinite,
                      height: 150,
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
                        border:
                            Border.all(width: 2.5, color: Color(0xff292333)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        children: [
                          SafeArea(
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10.0),
                                    child: ListTile(
                                      leading: Image.asset("assets/skribble.jpg"),
                                      title: Padding(
                                        padding: EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Skribble.io",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      subtitle: Text(
                                        " Join your crewmates in a multiplayer game of teamwork",
                                        style: new TextStyle(
                                            fontSize: 12.0, color: Colors.white),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: new Container(
                              margin: EdgeInsets.all(2.0),
                              width: double.infinity,
                              height: 40,
                              // color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child:  Image.asset("assets/like.jpg"),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: new Text("240",style: new TextStyle(
                                            color: Colors.white
                                        ),),
                                      )
                                    ],
                                  ),
                                  ElevatedButton.icon(
                                    icon: Icon(Icons.play_arrow),
                                    label: Text("Play"),
                                    onPressed: () => print("it's pressed"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 15.0,
                                            color: Color(0xffFCBC3D)
                                        ),
                                        borderRadius: BorderRadius.circular(32.0),

                                      ),
                                    ),

                                  ),

                                  new Row(
                                    children: [
                                      Icon(Icons.person_sharp,color: Colors.white,),
                                      new Text("4-6 Players",style: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 130,
                height: 30,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xffFCBC3D))),
                  color: Color(0xffFCBC3D),
                  onPressed: () {

                  },
                  child: Row(
                    children: [
                      new Text(
                        "+",style: new TextStyle(
                        color: Colors.black
                      ),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),

                         Text(
                          "Add Game",

                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: 'vgarounded'),
                        ),

                    ],

                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              )
            ],
          ),
        ),
      ),
    );
  }
  // creategameList(){
  //  GameList =new List();
  // GameList.add(new FidiData("assets/amongus.jpg","Among Us","4-6 players","Join your crewmates in a multiplayer game of teamwork "));
  // GameList.add(new FidiData("assets/minimiltia.jpg","Among Us","4-6 players","Join your crewmates in a multiplayer game of teamwork"));
  // GameList.add(new FidiData("assets/skribble.jpg","Among Us","4-6 players","Join your crewmates in a multiplayer game of teamwork"));
  // GameList.add(new FidiData("assets/skribble.jpg","Among Us","4-6 players","Join your crewmates in a multiplayer game of teamwork"));
  // }
}
