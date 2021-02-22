import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';
import './player.dart';

class RoundsRepository extends BaseRepository<RoundsService> {
  final String matchId;

  List<Round> _rounds;

  RoundsRepository(
    RoundsService service, {
    this.matchId,
  }) : super(service: service);

  @override
  Future<void> loadData() async {
    try {
      final response = await service.getRounds();
      _rounds = [
        for (final document in response.documents) Round.fromDocument(document)
      ];
      finishLoading();
    } catch (_) {
      receivedError();
    }
  }

  List<Round> get rounds => _rounds;

  List<Round> getRoundsByMatchId(String matchId) {
    return _rounds.where((round) => round.matchId == matchId).toList();
  }

  Round getRound(String id) {
    try {
      return rounds.where((round) => round.id == id).single;
    } catch (_) {
      return null;
    }
  }

  int getAmoutOfRounds(String matchId){
    return getRoundsByMatchId(matchId).length + 1;
  }

  void sortRounds(List<Round> roundList) {
    roundList.sort((a, b) => a.date.compareTo(b.date));
  }

  DateTime getLatestDate(List<Round> roundList) {
    sortRounds(roundList);
    return roundList.last.date;
  }

  Future<void> appendRound(
      {String id,
      DateTime date,
      String matchId,
      int index,
      List<int> results}) {
    return service
        .appendRound(
          id: id,
          date: date,
          matchId: matchId,
          index: index,
          results: results,
        )
        .then((value) async => await loadData());
  }
}
