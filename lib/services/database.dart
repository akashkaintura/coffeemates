import 'package:cloud_firestore/cloud_firestore.dart';

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
}
