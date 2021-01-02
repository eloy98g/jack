import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class PlayerService extends BaseService {
  Future<QuerySnapshot> getPlayer() async {
    return Firestore.instance
        .collection('players')
        .where('name', isEqualTo: 'Sergi')
        .getDocuments();
  }

  Future<QuerySnapshot> getPlayersByMatchId(String matchId) async {
    return Firestore.instance
        .collection('players')
        .where('match_ids', arrayContains: matchId)
        .getDocuments();
  }
}

