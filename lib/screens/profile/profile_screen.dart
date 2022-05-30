import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'package:searchack/screens/auth/auth_screen.dart';
import 'package:searchack/screens/profile/profile_viewmodel.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/firebase_firestore_service.dart';

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
          db: context.read<FirebaseFirestoreServiceImpl>(),
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
                      context.watch<ProfileViewModel>().avatarLink == null
                          ? GestureDetector(
                              onTap: () async {
                                await context
                                    .read<ProfileViewModel>()
                                    .setProfileImage(user.email!);
                                await context
                                    .read<ProfileViewModel>()
                                    .getProfileImage(user.email!);
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    user.email!.split('@')[0].substring(0, 1) +
                                        ' ' +
                                        user.email!
                                            .split('@')[1]
                                            .substring(0, 1),
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                await context
                                    .read<ProfileViewModel>()
                                    .setProfileImage(user.email!);
                                await context
                                    .read<ProfileViewModel>()
                                    .getProfileImage(user.email!);
                              },
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage(
                                  context.watch<ProfileViewModel>().avatarLink!,
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                      Text(user.email!, style: const TextStyle(fontSize: 20)),
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (ctx) {
                              return MultiSelectDialog(
                                title: const Text('Навыки'),
                                items: [
                                  MultiSelectItem<String>('Dart', 'Dart'),
                                  MultiSelectItem<String>('Flutter', 'Flutter'),
                                  MultiSelectItem<String>('JS', 'JS'),
                                  MultiSelectItem<String>(
                                      'React Native', 'React Native'),
                                  MultiSelectItem<String>('TS', 'TS'),
                                  MultiSelectItem<String>('Web', 'Web'),
                                  MultiSelectItem<String>('HTML', 'HTML'),
                                  MultiSelectItem<String>('Android', 'Android'),
                                  MultiSelectItem<String>('iOS', 'iOS'),
                                  MultiSelectItem<String>('Swift', 'Swift'),
                                  MultiSelectItem<String>('Java', 'Java'),
                                  MultiSelectItem<String>('Kotlin', 'Kotlin'),
                                ],
                                initialValue: const [],
                                onConfirm: (values) async {
                                  await context
                                      .read<ProfileViewModel>()
                                      .setKeySkillsData(
                                        db: context.read<
                                            FirebaseFirestoreServiceImpl>(),
                                        userEmail:
                                            context.read<User?>()!.email!,
                                        list: values
                                            .map((e) => e.toString())
                                            .toList(),
                                      );
                                  await context
                                      .read<ProfileViewModel>()
                                      .getKeySkillsData(
                                        db: context.read<
                                            FirebaseFirestoreServiceImpl>(),
                                        userEmail:
                                            context.read<User?>()!.email!,
                                      );
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: context
                                        .watch<ProfileViewModel>()
                                        .keySkills ==
                                    null
                                ? const Text(
                                    'Добавьте ключевые навыки',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                : SizedBox(
                                    height: 20,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            context
                                                .watch<ProfileViewModel>()
                                                .keySkills![index],
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: context
                                          .watch<ProfileViewModel>()
                                          .keySkills!
                                          .length,
                                      scrollDirection: Axis.horizontal,
                                    ),
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
                            'О себе',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showMyDialog(() async {
                            await context
                                .read<ProfileViewModel>()
                                .setDescriptionData(
                                  db: context
                                      .read<FirebaseFirestoreServiceImpl>(),
                                  userEmail: context.read<User?>()!.email!,
                                  text: _descriptionTextController.text,
                                );
                            await context
                                .read<ProfileViewModel>()
                                .getDescriptionData(
                                  db: context
                                      .read<FirebaseFirestoreServiceImpl>(),
                                  userEmail: context.read<User?>()!.email!,
                                );
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              context.watch<ProfileViewModel>().description ??
                                  'Добавьте описание',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
