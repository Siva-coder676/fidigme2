import 'package:flutter/material.dart';
class FidiGame extends StatefulWidget {
  @override
  _FidiGameState createState() => _FidiGameState();
}

class _FidiGameState extends State<FidiGame> {
  TextEditingController _controller=new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        title:Text("FidiGames")
      ),
      body: Container(
        child: SingleChildScrollView(
                  child: Column(
            children:[
              SizedBox(
                height: 10.0,
              ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal:30.0),
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
                                        color:Color(0xff292333),
                                         
                                      )
                                    ],
                                border:
                                    Border.all(width: 2.5, color:Color(0xff292333)),
                                shape: BoxShape.rectangle,
                              ),
                              child: new TextField(
                                controller: _controller,
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  prefixIcon: Icon(Icons.search,color:Colors.white),
                                  hintText: 'Search',
                                  hintStyle: new TextStyle(
                                    
                                     fontSize: 15.0,
                                      color: Colors.white,
                                      fontFamily: 'vgarounded',
                                      fontWeight: FontWeight.w500
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
               ),
                 ],
          ),
        ),
      ),
    );
  }
}