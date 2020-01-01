import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/model/brew.dart';
import 'package:flutter_todo/model/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //Collection reference
  final CollectionReference brewCollection =
  Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //List of brews from snapshot
  List<Brew> _brewListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(name: doc.data['name'] ?? '',
          sugars: doc.data['sugars'] ?? '',
          strength: doc.data['strength'] ?? '');
    }).toList();
  }

  //Get Brew Streams
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshots);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']
    );
  }

// get userr doc streams

  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
}
