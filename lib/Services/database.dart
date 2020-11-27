import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection =

      //created directly behind the scene (Firestore -> FirebaseFirestore)
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    //Documents() -> docu() ; .setData -> .set
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //brew list form snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
          name: doc.data()['name'] ?? '',
          strength: doc.data()['strength'] ?? 0,
          sugars: doc.data()['sugars'] ?? '0');
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brew {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }
}
