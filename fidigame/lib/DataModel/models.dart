import 'package:firebase_database/firebase_database.dart';
// class FidiData{
//
//   String _id;
//   String _name;
//   String _Desc;
//   String _url;
//   String _MiniCount;
//   String _MaxCount;
//
//   FidiData(this._id, this._name, this._Desc,this._url,this._MiniCount,this._MaxCount);
//
//   FidiData.map(dynamic obj) {
//   this._id = obj['id'];
//   this._name = obj['name'];
//   this._Desc = obj['Desc'];
//   this._url=obj['url'];
//   this._MiniCount=obj['MiniCount'];
//   this._MaxCount=obj['MaxCount'];
//   }
//
//   String get id => _id;
//   String get name => _name;
//   String get Desc => _Desc;
//   String get url=>_url;
//   String get MiniCount=>_MiniCount;
//   String get MaxCount=>_MaxCount;
//
//   FidiData.fromSnapshot(DataSnapshot snapshot) {
//   _id = snapshot.key;
//   _name = snapshot.value['name'];
//   _Desc = snapshot.value['Desc'];
//   _url=snapshot.value['url'];
//   _MiniCount=snapshot.value['MiniCount'];
//   _MaxCount=snapshot.value["MaxCount"];
//   }
//   }
//
