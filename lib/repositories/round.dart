import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';
import './player.dart';

class PlayerScore {
  String name;
  int score;
}

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
        for (final document in response.documents)
          Round.fromDocument(document)
      ];
      finishLoading();
    } catch (_) {
      receivedError();
    }
  }

  List<Round> get rounds => _rounds;

  List<Round> getRoundsByMatchId(String matchId){
    return _rounds.where((round) => round.matchId == matchId).toList();
  }
}
