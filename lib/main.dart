import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/db/database.dart';
import 'package:searchack/screens/main/main_screen.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/firebase_firestore_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final database = HacksDatabase();

  // await database.into(database.hacks).insert(
  //       HacksCompanion.insert(
  //         title: 'Hack Money',
  //         description: 'Один из крупнеших хакатонов по DeFi',
  //         startDate: 1662741960,
  //         endDate: 1665333961,
  //       ),
  //     );

  final Hacks = await database.select(database.hacks).get();
  print('Hacks in database: $Hacks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationServiceImpl(FirebaseAuth.instance),
        ),
        Provider<FirebaseFirestoreService>(
          create: (_) =>
              FirebaseFirestoreServiceImpl(FirebaseFirestore.instance),
        ),
        StreamProvider<User?>(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
