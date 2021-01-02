import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String id, name, photoUrl, token;
  final List<String> matchIds;

  const Player({
    this.id,
    this.name,
    this.photoUrl,
    this.matchIds,
    this.token
  });

  factory Player.fromDocument(DocumentSnapshot document) {
    return Player(
      id: document.documentID,
      name: document['name'],
      photoUrl: document['photo_url'],
      matchIds: document['match_ids']?.cast<String>(),
      token: document['token'],
    );
  }
}
