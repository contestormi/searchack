import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/screens/auth/auth_screen.dart';
import 'package:searchack/screens/profile/profile_viewmodel.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/db_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _descriptionTextController =
      TextEditingController();

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 300));
    await context.read<ProfileViewModel>().init(
          db: context.read<DataBaseServiceImpl>(),
          userEmail: context.read<User?>()!.email!,
        );
  }

  Future<void> _showMyDialog(onPressed) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Редактировать описание'),
          content: TextFormField(
            controller: _descriptionTextController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Изменить'),
              onPressed: () async {
                await onPressed();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Профиль',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await context.read<AuthenticationService>().signOut();
                context.read<User?>() == null
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthScreen()),
                        (_) => false)
                    : null;
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Consumer<User?>(
        builder: (_, user, ___) {
          return user == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      user.photoURL == null
                          ? Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            )
                          : Image.network(context.watch<User?>()!.photoURL!),
                      Text(user.email!),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ключевые навыки',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'О себе',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showMyDialog(() async {
                            await context
                                .read<ProfileViewModel>()
                                .setDescriptionData(
                                  db: context.read<DataBaseServiceImpl>(),
                                  userEmail: context.read<User?>()!.email!,
                                  text: _descriptionTextController.text,
                                );
                            await context
                                .read<ProfileViewModel>()
                                .getDescriptionData(
                                  db: context.read<DataBaseServiceImpl>(),
                                  userEmail: context.read<User?>()!.email!,
                                );
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              context.watch<ProfileViewModel>().description ??
                                  'Добавьте описание',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Социальные сети',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
