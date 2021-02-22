import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String id, name, photoUrl, token;

  const Player({this.id, this.name, this.photoUrl, this.token});

  factory Player.fromDocument(DocumentSnapshot document) {
    return Player(
      id: document.documentID,
      name: document['name'],
      photoUrl: document['photo_url'],
      token: document['token'],
    );
  }
}
