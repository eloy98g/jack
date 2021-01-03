import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class RoundsService extends BaseService {
  Future<QuerySnapshot> getRounds() async {
    return Firestore.instance
        .collection('rounds')
        .getDocuments();
  }
}
