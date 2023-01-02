import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GuestBookMessage {
  GuestBookMessage({required this.name, required this.message});
  final String name;
  final String message;
}

class ChatViewModel with ChangeNotifier {
  List<GuestBookMessage> _guestBookMessages = [];
  List<GuestBookMessage> get guestBookMessages => _guestBookMessages;

  void initMessages() {
    FirebaseAuth.instance.userChanges().listen((user) {
      FirebaseFirestore.instance
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .listen((snapshot) {
        _guestBookMessages = [];
        for (final document in snapshot.docs) {
          _guestBookMessages.add(
            GuestBookMessage(
              name: document.data()['name'] as String,
              message: document.data()['text'] as String,
            ),
          );
        }
        notifyListeners();
      });
    });
  }

  Future<DocumentReference> addMessage(String message) {
    return FirebaseFirestore.instance
        .collection('messages')
        .add(<String, dynamic>{
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser!.email,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }
}
