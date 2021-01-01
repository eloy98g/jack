import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String id, name;

  const Player({
    this.id,
    this.name,
  });

  factory Player.fromDocument(DocumentSnapshot document) {
    return Player(
      id: document.documentID,
      name: document['name'],
    );
  }
}
