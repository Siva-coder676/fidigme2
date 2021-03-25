import 'dart:io';
import 'package:fidigame/Firestore/firestore_service.dart';
import 'package:fidigame/fidigame/fidigame.dart';
import 'package:fidigame/model/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class AddGame extends StatefulWidget {
  FidiData fidiData;
  AddGame(this.fidiData);
  @override
  _AddGameState createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  TextEditingController _name;
  TextEditingController _Desc;
  TextEditingController _url;
  TextEditingController _MiniCount;
  TextEditingController _MaxCount;
  FireStoreService fireServ = new FireStoreService();
  final notesReference =
      FirebaseDatabase.instance.reference().child('Fidigame');

  File _image;
  final picker = ImagePicker();
  String _uploadFileURL;
  CollectionReference myCollection;

  String _dropDownValue;
  @override
  void initState() {
    _name = new TextEditingController(text: widget.fidiData.name);
    _Desc = new TextEditingController(text: widget.fidiData.Desc);
    _url = new TextEditingController(text: widget.fidiData.url);
    _MiniCount = new TextEditingController(text: widget.fidiData.Minicount);
    _MaxCount = new TextEditingController(text: widget.fidiData.Maxcount);
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _Desc.dispose();
    _url.dispose();
    _MiniCount.dispose();
    _MaxCount.dispose();
  }

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
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => FidiGame())
                        );
              }),
          title: Text("Add a Game",
              style: TextStyle(
                  fontFamily: 'Poppins',
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
                        style: TextStyle(
                            fontFamily: 'Poppins',
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
                child: TextField(
                    controller: _name,
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                      labelText: '',
                      contentPadding: EdgeInsets.all(10.0),
                      labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Color(0xffFEFEFE)),
                      filled: true,
                      fillColor: Color(0xff292333),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide:
                            BorderSide(color: Color(0xff292333), width: 2.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff292333)),
                      ),
                    ),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xffFEFEFE),
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal)),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 29, left: 28),
                    child: new Text("Description",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            color: Color(0xffFEFEFE))),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 5.0, bottom: 8.0, left: 24.0, right: 16.0),
                child: TextField(
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                  controller: _Desc,
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: '',
                    labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xffFEFEFE)),
                    filled: true,
                    fillColor: Color(0xff292333),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Color(0xff292333)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Color(0xff292333)),
                    ),
                  ),
                ),
              ),
              new Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28, top: 33, bottom: 5.0),
                    child: new Text("Game URL",
                        style: TextStyle(
                            fontFamily: 'Poppins',
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
                child: TextField(
                    controller: _url,
                    decoration: new InputDecoration(
                      labelText: '',
                      contentPadding: EdgeInsets.all(10.0),
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Color(0xffFEFEFE)),
                      filled: true,
                      fillColor: Color(0xff292333),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide:
                            BorderSide(color: Color(0xff292333), width: 2.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff292333)),
                      ),
                    ),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xffFEFEFE),
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal)),
              ),
              new Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 28.0, top: 36.0, bottom: 8.0, right: 144.0),
                    child: new Text("Players Count",
                        style: TextStyle(
                            fontFamily: 'Poppins',
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
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              color: Color(0xffFEFEFE))),
                    ),
                    SizedBox(width: 8.0),
                    new Container(
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
                      child: TextField(
                          controller: _MiniCount,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            labelText: '',

                            //contentPadding:EdgeInsets.only(left: 2.0),
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                color: Color(0xffFEFEFE)),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xffFEFEFE),
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: new Text("Maximum Count",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              color: Color(0xffFEFEFE))),
                    ),
                    SizedBox(width: 8.0),
                    new Container(
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
                      child: TextField(
                          controller: _MaxCount,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            labelText: '',
                            //contentPadding:EdgeInsets.only(left: 2.0),
                            labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                color: Color(0xffFEFEFE)),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xffFEFEFE),
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal)),
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
                        style: TextStyle(
                            fontFamily: 'Poppins',
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
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xffFEFEFE),
                                  fontSize: 14.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400)),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, top: 13.0, bottom: 10.0),
                          child: Text(_dropDownValue,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
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
                            style: TextStyle(
                                fontFamily: 'Poppins', color: Colors.black)),
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
              _image == null
                  ? new Container(
                      margin:
                          EdgeInsets.only(top: 41.0, left: 24.0, right: 16.0),
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
                        border:
                            Border.all(width: 2.5, color: Color(0xff292333)),
                        shape: BoxShape.rectangle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          chooseImage();
                          print("button is tapped");
                        },
                        child: Container(
                          child: Row(children: [
                            Container(
                                child: ClipRRect(
                              child: new Image.asset(
                                "assets/Upload.png",
                                width: 30,
                                height: 10,
                              ),
                            )),
                            Text("Upload an image",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xffFEFEFE),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal)),
                          ]),
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.50,
                      height: MediaQuery.of(context).size.height * 0.30,
                      margin:
                          EdgeInsets.only(top: 41.0, left: 24.0, right: 16.0),
                      child: Image.file(
                        _image,
                        fit: BoxFit.contain,
                      )),
              Padding(
                  padding: EdgeInsets.only(
                      top: 37, left: 107, right: 107, bottom: 49),
                  child: ButtonTheme(
                    minWidth: 200,
                    height: 48,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: Color(0xffFCBC3C))),
                      color: Color(0xffFCBC3C),
                      onPressed: () {
                        uploadFile();
                      },
                      child: Text('Submit',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });

    //uploadFile();

    if (pickedFile.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image = File(response.file.path);
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Path.basename(_image.path)}');

    firebase_storage.UploadTask task = ref.putFile(_image);

    task.whenComplete(() async {
      print('file uploaded');
      await ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadFileURL = fileURL;
        });
      }).whenComplete(() async {
        await fireServ
            .creategamelist(_name.text, _Desc.text, _url.text, _MiniCount.text,
                _MaxCount.text, _uploadFileURL)
            .then((_) {
          print("data added");
        });

        print('link added to database');
      });
    });
  }
}
