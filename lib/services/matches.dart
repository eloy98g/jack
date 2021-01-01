import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class MatchesService extends BaseService {
  Future<QuerySnapshot> getMatchesByPlayerId(String playerId) async {
    return Firestore.instance
        .collection('matches')
        .where('players', arrayContains: playerId)
        .getDocuments();
  }
}
