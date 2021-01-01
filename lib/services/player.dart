import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class PlayerService extends BaseService {
  Future<QuerySnapshot> getPlayer() async {
    return Firestore.instance
        .collection('players')
        .where('name', isEqualTo: 'Sergi')
        .getDocuments();
  }
}

