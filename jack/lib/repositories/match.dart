import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class MatchRepository extends BaseRepository<MatchesService> {
  final String gameId;
  List<Match> matches;

  MatchRepository(MatchesService service, {this.gameId})
      : super(service: service);

  @override
  Future<void> loadData() async {
    try {
      final response = await service.getMatchesByGameId(gameId);
      matches = [
        for (final match in response.documents) Match.fromDocument(match),
      ];

      finishLoading();
    } catch (_) {
      receivedError();
    }
  }
}
