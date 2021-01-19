import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class RoundsService extends BaseService {
  Future<QuerySnapshot> getRounds() async {
    return Firestore.instance
        .collection('rounds')
        .getDocuments();
  }

  Future appendRound({
    String id,
    String date,
    String matchId,
    String index,
    List<String> results
  }) async {
    if (id != null)
      return Firestore.instance
          .collection('rounds')
          .document(id)
          .updateData({
        'date': date,
        'match_id': matchId,
        'index': int.parse(index),
        'results': results,
      });
    else
      return Firestore.instance.collection('rounds').add({
        'date': date,
        'match_id': matchId,
        'index': int.parse(index),
        'results': results,
      });
  }
}
