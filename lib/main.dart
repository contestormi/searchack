import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/db/database.dart';
import 'package:searchack/screens/auth/auth_screen.dart';
import 'package:searchack/screens/search/search_viewmodel.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/firebase_firestore_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        ChangeNotifierProvider<SearchViewModel>(
          create: (_) => SearchViewModel(),
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
        Provider<HacksDatabase>(
          create: (context) => HacksDatabase(),
          dispose: (context, db) => db.close(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),
    );
  }
}
