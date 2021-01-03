import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

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
    List<Round> aux = _rounds.where((round) => round.matchId == matchId).toList();
    print('AAAAAAAAAUUUUUUUUUUAAAAAAAAAAAAAAAAA');
    print(aux.length);
    return aux;
  }
}
