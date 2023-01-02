import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/screens/chat/chat_screen.dart';
import 'package:searchack/screens/chat/chat_viewmodel.dart';
import 'package:searchack/screens/persons/persons_screen.dart';
import 'package:searchack/screens/profile/profile_screen.dart';
import 'package:searchack/screens/profile/profile_viewmodel.dart';
import 'package:searchack/screens/search/search_screen.dart';
import 'package:searchack/services/firebase_firestore_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const SearchScreen(),
    const PersonsScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProfileViewModel>(
            create: (_) => ProfileViewModel(),
          ),
          Provider<FirebaseFirestoreServiceImpl>(
            create: (_) =>
                FirebaseFirestoreServiceImpl(FirebaseFirestore.instance),
          ),
          ChangeNotifierProvider<ChatViewModel>(
            create: (_) => ChatViewModel(),
          ),
        ],
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Поиск',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Пользователи',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Сообщения',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Профиль',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.purple,
            onTap: _onItemTapped,
          ),
        ));
  }
}
