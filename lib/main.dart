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

late HacksDatabase database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  database = HacksDatabase();

  await database.into(database.hacks).insert(
        HacksCompanion.insert(
            title: "BEST Hack",
            description:
                "BEST Hack — это ежегодный хакатон, проводящийся'' студенческой организацией BEST (Board of European Students of Technology) Moscow при МГТУ им Н.Э. Баумана. Международная студенческая организация BEST дает уникальную возможность проявить талант, показать себя в деле и получить колоссальный опыт на хакатоне, который пройдёт в самом разгаре весны 2023!",
            startDate: 1668459600000,
            endDate: 1669755600000,
            sponsorName: 'НИЯУ МИФИ',
            companyOrganizer: 'Codenrock',
            prizeFundAmount: 1500000,
            address: "Малый Конюшковский переулок, д. 2",
            imageLink:
                "https://static.tildacdn.com/tild6262-3633-4461-a162-336134303336/banner_tg-01.png"),
      );

  await database.into(database.hacks).insert(
        HacksCompanion.insert(
          title: "Хакатон «Цифровая фармакология",
          description:
              "Встречайте: Хакатон «Цифровая фармакология: предсказательное моделирование», который будет посвящен решению задач на стыке IT, химии и медицины! Если вы хотели попробовать себя в одной из этих сфер, то наш хакатон – отличный способ открыть в себе новые таланты.",
          startDate: 1665867600000,
          endDate: 1666731600000,
          sponsorName: 'Российский фонд культуры',
          companyOrganizer: 'Российский фонд культуры',
          prizeFundAmount: 0,
          address: 'г. Москва, улица Преображенская дом 9',
          imageLink:
              "https://static.tildacdn.com/tild6137-3633-4339-a237-383937633636/IMG_0560.png",
        ),
      );

  await database.into(database.hacks).insert(
        HacksCompanion.insert(
          title: "Хакатон Nuclear IT Hack",
          description:
              "Nuclear IT Hack — это возможность не только продемонстрировать свои навыки разработчика, но и стать частью профессионального сообщества, найти единомышленников и кураторов для своих будущих проектов.",
          startDate: 1652389200000,
          endDate: 1652648400000,
          sponsorName: 'Codenrock',
          companyOrganizer: 'Сколково',
          prizeFundAmount: 800000,
          address: 'Онлайн',
          imageLink:
              "https://static.tildacdn.com/tild3165-6635-4238-b961-396437613232/photo_2023-04-22_17-.jpg",
        ),
      );
  await database.into(database.hacks).insert(
        HacksCompanion.insert(
          title: "Хакатон по кибериммунной разработке",
          description:
              "Кибериммунный подход – это новый практический навык для разработчиков. На хакатоне по кибериммунной разработке вы получите возможность пройти небольшой бесплатный курс от «Лаборатории Касперского» и выбрать один из двух треков от партнёров хакатона: \n1. Создание устройства детектирования радиационного фона в паропроводе на АЭС \n2. Создание программируемого логического контроллера для теплоэлектроцентрали",
          startDate: 1636664400000,
          endDate: 1636923600000,
          sponsorName: 'HackDay',
          companyOrganizer: 'Codenrock',
          prizeFundAmount: 100000,
          address: 'г. Москва, Улица Пушкина дом Колотушкина',
          imageLink:
              "https://static.tildacdn.com/tild3939-3833-4264-b964-613863333031/photo_2023-03-28_13-.jpg",
        ),
      );

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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),
    );
  }
}
