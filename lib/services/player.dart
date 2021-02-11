import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class PlayerService extends BaseService {
  Future<QuerySnapshot> getPlayers(String playerName) async {
    return Firestore.instance
        .collection('players')
        // .where('players', arrayContains: playerId)
        .getDocuments();
  }
}
