import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/db/database.dart';
import 'package:searchack/screens/main/main_screen.dart';
import 'package:searchack/screens/search/search_viewmodel.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/firebase_firestore_service.dart';

late HacksDatabase database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  database = HacksDatabase();

  // await database.into(database.hacks).insert(
  //       HacksCompanion.insert(
  //         title: 'FIT - M',
  //         description: 'МЕЖДИСЦИПЛИНАРНЫЙ ХАКАТОН ПО ПРИМЕНЕНИЮ IT РЕШЕНИЙ'
  //             ' В ФУНДАМЕНТАЛЬНЫХ И ПРИКЛАДНЫХ НАУЧНЫХ ИССЛЕДОВАНИЯХ',
  //         startDate: 1668459600000,
  //         endDate: 1669755600000,
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
  //         startDate: 1665867600000,
  //         endDate: 1666731600000,
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
  //         startDate: 1652389200000,
  //         endDate: 1652648400000,
  //         sponsorName: 'Codenrock',
  //         companyOrganizer: 'Сколково',
  //         prizeFundAmount: 800000,
  //         address: 'Онлайн',
  //       ),
  //     );
  // await database.into(database.hacks).insert(
  //       HacksCompanion.insert(
  //         title: 'Hack Money',
  //         description: 'Один из крупнеших хакатонов по DeFi',
  //         startDate: 1636664400000,
  //         endDate: 1636923600000,
  //         sponsorName: 'HackDay',
  //         companyOrganizer: 'Codenrock',
  //         prizeFundAmount: 100000,
  //         address: 'г. Москва, Улица Пушкина дом Колотушкина',
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
