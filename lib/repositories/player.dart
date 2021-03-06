import '../models/index.dart';
import '../services/index.dart';
import 'index.dart';

class PlayerRepository extends BaseRepository<PlayerService> {
  final String playerName;

  List<Player> _players;

  PlayerRepository(PlayerService service, {this.playerName})
      : super(service: service);

  @override
  Future<void> loadData() async {
    try {
      final response = await service.getPlayers(playerName);

      _players = [
        for (final document in response.documents) Player.fromDocument(document)
      ];

      finishLoading();
    } catch (_) {
      receivedError();
    }
  }

  List<Player> get players => _players;

  List<Player> getPlayersByMatchId(List<String> playerIds) {
    List<Player> playerList = List();
    for (final id in playerIds) {
      playerList.add(getPlayerById(id));
    }
    return playerList;
  }

  List<String> getPlayerNames(List<String> playerIds) {
    List<String> playerNames = List();
    for (final id in playerIds) {
      playerNames.add(getPlayerById(id).name);
    }
    return playerNames;
  }

  Player getPlayerById(String playerId) {
    try {
      return players.where((player) => player.id == playerId).single;
    } catch (_) {
      return null;
    }
  }
}
