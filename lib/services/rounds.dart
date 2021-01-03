import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class RoundsService extends BaseService {
  Future<QuerySnapshot> getRoundsByMatchId(String matchId) async {
    return Firestore.instance
        .collection('rounds')
        .where('match_id', isEqualTo: matchId)
        .getDocuments();
  }
}
