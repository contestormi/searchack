import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter, unused_import
// import 'dart:html' as html hide Document;
// ignore: unused_import
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:searchack/services/hack_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  HackService service = HackService();
  // await service.getHacks();

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<AuthenticationService>(
//           create: (_) => AuthenticationServiceImpl(FirebaseAuth.instance),
//         ),
//         ChangeNotifierProvider<SearchViewModel>(
//           create: (_) => SearchViewModel(),
//         ),
//         Provider<FirebaseFirestoreService>(
//           create: (_) =>
//               FirebaseFirestoreServiceImpl(FirebaseFirestore.instance),
//         ),
//         StreamProvider<User?>(
//           create: (context) =>
//               context.read<AuthenticationService>().authStateChanges,
//           initialData: null,
//         ),
//         Provider<HacksDatabase>(
//           create: (context) => HacksDatabase(),
//           dispose: (context, db) => db.close(),
//         ),
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: AuthScreen(),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Status {
  hacks,
  desc,
  done,
}

class _MyAppState extends State<MyApp> {
  late WebViewController controller;
  final String _url = 'https://hackathons.pro/';
  Status status = Status.hacks;
  List<Hack> list = [];

  @override
  void initState() {
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            try {
              if (status == Status.hacks) {
                await Future.delayed(const Duration(seconds: 1));
                final myHtml = await controller.runJavaScriptReturningResult(
                    'new XMLSerializer().serializeToString(document)');

                dom.Document finalHtml =
                    parser.parse(json.decode(myHtml as String));

                RegExp exp = RegExp(r'data-original="([^"]*)"');
                Iterable<Match> matches = exp.allMatches(finalHtml.outerHtml);

                for (int i = 0; i < matches.length - 12; i++) {
                  String? styleValue = matches.elementAt(i).group(1);

                  final name = finalHtml.querySelectorAll(
                      'div.js-feed-post-title.t-feed__post-title.t-name.t-name_md > a');
                  final desc = finalHtml.querySelectorAll(
                      'div > div.t-feed__col-grid__wrapper > div > div.js-feed-post-descr.t-feed__post-descr.t-descr.t-descr_xxs');
                  final redirectUrl = finalHtml.querySelectorAll(
                      'div > div.t-feed__col-grid__wrapper > div > div.js-feed-post-title.t-feed__post-title.t-name.t-name_md > a');

                  list.add(
                    Hack(
                      name: name.elementAt(i).text,
                      desc: desc.elementAt(i).text,
                      imageUrl: styleValue ?? '',
                      sourceUrl: _url,
                      redirectUrl:
                          redirectUrl.elementAt(i).attributes['href'] ?? '',
                    ),
                  );
                }
                print(list.length);
                print(list);
                status = Status.desc;
              }

              if (status == Status.desc) {
                await controller.loadRequest(Uri.parse(list[0].redirectUrl));
                await Future.delayed(const Duration(seconds: 1));
                final newMyHtml = await controller.runJavaScriptReturningResult(
                    'new XMLSerializer().serializeToString(document)');

                dom.Document newFinalHtml =
                    parser.parse(json.decode(newMyHtml as String));

                RegExp exp = RegExp(r'https://\S+');
                final registrationUrl =
                    newFinalHtml.querySelector('div > section > div > div');
                Iterable<Match> matches =
                    exp.allMatches(registrationUrl?.text ?? '');
                List<String> validMatches = [];

                for (int i = 0; i < matches.length; i++) {
                  final match = matches.elementAt(i).group(0);
                  if (match != null) {
                    validMatches.add(match);
                  }
                }
                print('REGURL: ${validMatches.toSet()}');
                // for (int i = 0; i < registrationUrl.length; i++) {
                //   final attribute = registrationUrl[i].attributes['href'];
                //   if (attribute != null && !attribute.contains('t.me')) {
                //     print('REGURL: $attribute');
                //   }
                // }

                status = Status.done;
              }
            } catch (e) {
              print(e);
            }
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(_url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }
}

class Hack {
  String name;
  String desc;
  String imageUrl;
  String sourceUrl;
  String redirectUrl;

  Hack({
    required this.name,
    required this.desc,
    required this.imageUrl,
    required this.sourceUrl,
    required this.redirectUrl,
  });

  @override
  String toString() {
    return '$name $desc $imageUrl $sourceUrl $redirectUrl';
  }
}
