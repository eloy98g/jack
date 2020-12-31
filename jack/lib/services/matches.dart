import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/index.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'index.dart';

class MatchesService extends BaseService {
  Future<QuerySnapshot> getMatchesByGameId(String gameId) {
    return Firestore.instance
        .collection('games')
        .where('game_id', isEqualTo: gameId)
        .getDocuments();
  }
}
