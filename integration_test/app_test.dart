import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:searchack/db/database.dart';
import 'package:searchack/screens/auth/auth_screen.dart';
import 'package:searchack/screens/search/search_viewmodel.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/firebase_firestore_service.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(
        MultiProvider(
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
            Provider<HacksDatabase>(
              create: (context) => HacksDatabase(),
              dispose: (context, db) => db.close(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthScreen(),
          ),
        ),
      );

      expect(find.text('Войти'), findsOneWidget);

      final fab = find.byKey(const ValueKey('Login button'));

      await tester.tap(fab);

      await tester.pumpAndSettle();

      final usernameField = find.ancestor(
        of: find.text('Введите почту'),
        matching: find.byType(TextField),
      );

      final passwordField = find.ancestor(
        of: find.text('Введите пароль'),
        matching: find.byType(TextField),
      );

      await tester.enterText(usernameField, "test@test.test");
      await tester.enterText(passwordField, "test123");

      final loginLoginButton = find.byKey(const ValueKey('Login Login Button'));

      await tester.tap(loginLoginButton);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(const ValueKey('SearchAppBar')), findsOneWidget);
    });
  });
}
