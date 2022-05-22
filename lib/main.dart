import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/screens/auth/auth_screen.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/db_service.dart';

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
        Provider<DataBaseService>(
          create: (_) => DataBaseServiceImpl(FirebaseFirestore.instance),
        ),
        StreamProvider<User?>(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),
    );
  }
}
