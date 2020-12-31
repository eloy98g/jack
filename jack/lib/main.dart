import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './ui/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(JackApp());
}

// class JackApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProxyProvider(
//           create: (_) => null,
//           update: (_, AdminRepository repository, __) => CentersRepository(
//             CentersService(),
//             cityId: repository.admin?.cityId,
//           ),
//         ),
//       ]
//   }
// }

class JackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phobos',
      home: Home(),
    );
  }
}

