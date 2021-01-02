import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class MatchesRepository extends BaseRepository<MatchesService> {
  final String playerId;

  List<Match> _matches;

  MatchesRepository(
    MatchesService service, {
    this.playerId,
  }) : super(service: service);

  @override
  Future<void> loadData() async {
    try {
      final response = await service.getMatchesByPlayerId(playerId);
      
      _matches = [
        for (final document in response.documents)
          Match.fromDocument(document)
      ];

      finishLoading();
    } catch (_) {
      receivedError();
    }
  }

  List<Match> get matches => _matches;
}
