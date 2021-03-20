import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:fidigame/DataModel/models.dart';
final CollectionReference myCollection=FirebaseFirestore.instance.collection('fidigame');
class FireStoreService{
  Future<FidiData> creategamelist(String name,String Desc,String url,String Minicount,String Maxcount,String image) async{
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.doc());

      final FidiData fidiData = new FidiData(name, Desc,url,Minicount,Maxcount,image);
      final Map<String, dynamic> data = fidiData.toMap();
      await tx.set(ds.reference, data);
      return data;
    };
    return FirebaseFirestore.instance.runTransaction(createTransaction).then((mapData) {
      return FidiData.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }
   Stream<QuerySnapshot> getgameList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }
}