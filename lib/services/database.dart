import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeemate/models/coffee.dart';
import 'package:coffeemate/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //Collection reference
  final CollectionReference coffeeCollection =
      Firestore.instance.collection('coffee');

  Future updateUserData(String name, String sugars, int strength) async {
    return await coffeeCollection.document(uid).setData({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
  }

  //coffeeList

  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coffee(
          name: doc.data['name'] ?? '',
          strength: doc.data['sugars'] ?? 0,
          sugars: doc.data['strength'] ?? '0');
    }).toList();
  }

  //get firebase stream
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']);
  }

  Stream<List<Coffee>> get coffees {
    return coffeeCollection.snapshots().map(_coffeeListFromSnapshot);
  }

  Stream<UserData> get userData {
    return coffeeCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
