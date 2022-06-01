import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/screens/chat/chat_viewmodel.dart';
import 'package:searchack/services/auth_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300))
        .then((value) => context.read<ChatViewModel>().initMessages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Consumer<ChatViewModel>(
        builder: (context, viewmodel, child) {
          return StreamBuilder<User?>(
              stream: context.read<AuthenticationService>().authStateChanges,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ListView.builder(
                            reverse: true,
                            itemCount: viewmodel.guestBookMessages.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: snapshot.data!.email! ==
                                        viewmodel.guestBookMessages[index].name
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: snapshot.data!.email! ==
                                              viewmodel
                                                  .guestBookMessages[index].name
                                          ? Colors.grey[500]
                                          : Colors.grey[600],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            viewmodel
                                                .guestBookMessages[index].name,
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          Text(
                                              viewmodel.guestBookMessages[index]
                                                  .message,
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  const SizedBox(width: 10)
                                ],
                              );
                            },
                          )),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  viewmodel.addMessage(_controller.text);
                                  _controller.clear();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.purple)),
                                child: const Text('Отправить'),
                              ),
                              const SizedBox(width: 10)
                            ],
                          )
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              });
        },
      ),
    ));
  }
}
