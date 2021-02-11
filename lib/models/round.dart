import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Round {
  final String id, matchId;
  final DateTime date;
  final int index;
  final List<int> results;

  const Round({this.id, this.date, this.matchId, this.index, this.results});

  factory Round.fromDocument(DocumentSnapshot document) {
    return Round(
        id: document.documentID,
        date: document['date'].toDate(),
        matchId: document['match_id'],
        index: document['index'],
        results: document['results']?.cast<int>());
  }
}
