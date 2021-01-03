import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class RoundsRepository extends BaseRepository<RoundsService> {
  final List<Match> matches;

  List<Round> _rounds;

  RoundsRepository(
    RoundsService service, {
    this.matches,
  }) : super(service: service);

  @override
  Future<void> loadData() async {
    try {
      _rounds = List();
      for (final match in matches) {
        final response = await service.getRoundsByMatchId(match.id);

        _rounds.addAll([
          for (final document in response.documents)
            Round.fromDocument(document)
        ]);
      }

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
