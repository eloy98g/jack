import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './ui/screens/home.dart';
import './services/index.dart';
import './repositories/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(JackApp());
}

class JackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlayerRepository(PlayerService()),
        ),
        ChangeNotifierProxyProvider(
          create: (_) => null,
          update: (_, PlayerRepository repository, __) => MatchesRepository(
            MatchesService(),
            playerId: 'N29fVAdKpBtcnOoEGZZW'/*repository.player.id*/,
          ),
        ),
        ChangeNotifierProxyProvider(
          create: (_) => null,
          update: (_, MatchesRepository repository, __) => RoundsRepository(
            RoundsService(),
            matchId: 'fH6b2UrkhQtAmn6mYHP7',
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Jack',
        home: Home(),
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

// class JackApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Jack',
//       home: Home(),
//     );
//   }
// }

