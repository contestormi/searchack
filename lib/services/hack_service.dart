import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:searchack/models/hack_model.dart';
import 'package:web_scraper/web_scraper.dart';

class HackService {
  Future<void> getHacks() async {
    final webScraper = WebScraper('https://hackathons.pro/');
    List<Map<String, dynamic>> elements =
        webScraper.getElement('t-feed__textwrapper > a.caption', ['href']);
    print(elements);
    // var data = await rootBundle.loadString('assets/data.json');
    // var body = json.decode(data) as List<dynamic>;
    // return body
    //     .map((model) => Hackathon.fromJson(model as Map<String, dynamic>))
    //     .toList();
  }
}
