import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/db/database.dart';
import 'package:searchack/screens/main/main_screen.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/firebase_firestore_service.dart';

late HacksDatabase database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  database = HacksDatabase();

  // await database.into(database.hacks).insert(
  //       HacksCompanion.insert(
  //         title: 'Hack Money',
  //         description: 'Один из крупнеших хакатонов по DeFi',
  //         startDate: 1662741960,
  //         endDate: 1665333961,
  //         sponsorName: 'HackDay',
  //         companyOrganizer: 'Codenrock',
  //         prizeFundAmount: 100000,
  //         address: 'г. Москва, Улица Пушкина дом Колотушкина',
  //       ),
  //     );

  // await database.into(database.hacks).insert(
  //       HacksCompanion.insert(
  //         title: 'FIT - M',
  //         description: 'МЕЖДИСЦИПЛИНАРНЫЙ ХАКАТОН ПО ПРИМЕНЕНИЮ IT РЕШЕНИЙ'
  //             ' В ФУНДАМЕНТАЛЬНЫХ И ПРИКЛАДНЫХ НАУЧНЫХ ИССЛЕДОВАНИЯХ',
  //         startDate: 1662741960,
  //         endDate: 1664920509,
  //         sponsorName: 'НИЯУ МИФИ',
  //         companyOrganizer: 'Codenrock',
  //         prizeFundAmount: 1500000,
  //         address: 'Онлайн',
  //       ),
  //     );

  // await database.into(database.hacks).insert(
  //       HacksCompanion.insert(
  //         title: 'История будущего',
  //         description: 'Культурно-образовательный хакатон',
  //         startDate: 1665006959,
  //         endDate: 1664920509,
  //         sponsorName: 'Российский фонд культуры',
  //         companyOrganizer: 'Российский фонд культуры',
  //         prizeFundAmount: 0,
  //         address: 'г. Москва, улица Преображенская дом 9',
  //       ),
  //     );

  // await database.into(database.hacks).insert(
  //       HacksCompanion.insert(
  //         title: 'Sovcombank Team Challenge 2022',
  //         description: 'Примени свои знания, соревнуйся с'
  //             ' лучшими специалистами данного направления, добавь'
  //             ' интересный кейс в портфолио и стань'
  //             ' частью команды Совкомбанка',
  //         startDate: 1664661359,
  //         endDate: 1665006959,
  //         sponsorName: 'Codenrock',
  //         companyOrganizer: 'Сколково',
  //         prizeFundAmount: 800000,
  //         address: 'Онлайн',
  //       ),
  //     );

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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
