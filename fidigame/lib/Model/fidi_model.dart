import 'package:fidigame/Fidigame/fidigame.dart';

class Event {
  String gameImage;
  String gameName;
  String playerSize;
  String gameDesc;
  Event({this.gameImage, this.gameName, this.playerSize, this.gameDesc});
}
final amoungus=Event(
    gameImage: "assets/amongus.jpg",
    gameDesc: "Join your crewmates in a multiplayer game of teamwork",
    playerSize: "4-6 players",
    gameName: "Among Us"
  );
  final minimiltia=Event(
     gameImage: "assets/minimiltia.jpg",
    gameDesc: "Join your crewmates in a multiplayer game of teamwork",
    playerSize: "4-6 players",
    gameName: "Mini Militia"
  );
  final Skribble=Event(
 gameImage: "assets/skribble.jpg",
    gameDesc: "Join your crewmates in a multiplayer game of teamwork",
    playerSize: "4-6 players",
    gameName: "Skribble.io"
  );
   final Skribble1=Event(
 gameImage: "assets/skribble.jpg",
    gameDesc: "Join your crewmates in a multiplayer game of teamwork",
    playerSize: "4-6 players",
    gameName: "Skribble.io"
  ); 
  final events=[
    amoungus,
    minimiltia,
    Skribble,
    Skribble1
  ];
  

