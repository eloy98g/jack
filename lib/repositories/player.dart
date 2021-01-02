import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class PlayerRepository extends BaseRepository<PlayerService> {
  Player player;

  PlayerRepository(PlayerService service) : super(service: service);

  @override
  Future<void> loadData() async {}

  Future<bool> loadPlayer() async {
    try {
      final response = await service.getPlayer();
      if (response.documents.isNotEmpty) {
        player = Player.fromDocument(response.documents.first);

        finishLoading();
        return true;
      }

      finishLoading();
      return false;
    } catch (_) {
      receivedError();
      return false;
    }
  }

  String get id => player.id;
}
