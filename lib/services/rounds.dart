import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class RoundsService extends BaseService {
  Future<QuerySnapshot> getRounds() async {
    return Firestore.instance.collection('rounds').getDocuments();
  }

  Future appendRound(
      {String id,
      DateTime date,
      String matchId,
      List<int> results}) async {
    if (id != null)
      return Firestore.instance.collection('rounds').document(id).updateData({
        'date': date,
        'match_id': matchId,
        'results': results,
      });
    else
      return Firestore.instance.collection('rounds').add({
        'date': date,
        'match_id': matchId,
        'results': results,
      });
  }
}
