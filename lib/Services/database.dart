import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference brewCollection =
  
  //created directly behind the scene (Firestore -> FirebaseFirestore)
      FirebaseFirestore.instance.collection('brews');
}
