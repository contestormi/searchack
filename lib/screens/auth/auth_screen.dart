import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/db/database.dart';
import 'package:searchack/screens/login/login_screen.dart';
import 'package:searchack/screens/register/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    addHacks();
    super.initState();
  }

  Future<void> addHacks() async {
    final database = context.read<HacksDatabase>();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/splash_background.png',
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/search_icon.png',
                        scale: 2,
                      ),
                      const SizedBox(width: 10),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'SearcHack',
                          style: TextStyle(fontSize: 46),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  key: const ValueKey('Login button'),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen())),
                  child: const Text(
                    'Регистрация',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: Colors.purple),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
