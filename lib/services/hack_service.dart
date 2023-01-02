import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:searchack/models/hack_model.dart';

class HackService {
  Future<List<Hackathon>> getHacks() async {
    var data = await rootBundle.loadString('assets/data.json');
    var body = json.decode(data) as List<dynamic>;
    return body
        .map((model) => Hackathon.fromJson(model as Map<String, dynamic>))
        .toList();
  }
}
