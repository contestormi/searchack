import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:searchack/models/hack_model.dart';
import 'package:searchack/services/auth_service.dart';
import 'package:searchack/services/hack_service.dart';

import 'package:searchack/services/image_service.dart';

@GenerateNiceMocks([
  MockSpec<ImageService>(),
  MockSpec<HackService>(),
  MockSpec<AuthenticationService>(),
])
import 'unit_tests.mocks.dart';

void main() {
  test('Image service must call only 1 time and return path', () async {
    final imageService = MockImageService();

    when(imageService.getImage()).thenAnswer((_) async {
      return await Future<String>.value('path');
    });

    final path = await imageService.getImage();

    verify(imageService.getImage()).called(1);

    expect(path, 'path');
  });

  test('Hack service must call only 1 time and return List', () async {
    final hackService = MockHackService();

    when(hackService.getHacks()).thenAnswer((_) async {
      return await Future<List<Hackathon>>.value([]);
    });

    final hacks = await hackService.getHacks();

    verify(hackService.getHacks()).called(1);

    expect(hacks, []);
  });

  test('Auth Service', () async {
    final authService = MockAuthenticationService();

    when(authService.signIn(email: 'test@test.test', password: 'password'))
        .thenAnswer((_) async {
      return await Future<bool>.value(true);
    });

    when(authService.signUp(email: 'test@test.test', password: 'password'))
        .thenAnswer((_) async {
      return await Future<bool>.value(true);
    });

    final signIn =
        await authService.signIn(email: 'test@test.test', password: 'password');

    final signUp =
        await authService.signUp(email: 'test@test.test', password: 'password');

    verify(authService.signIn(email: 'test@test.test', password: 'password'))
        .called(1);

    verify(authService.signUp(email: 'test@test.test', password: 'password'))
        .called(1);

    expect(signIn, true);

    expect(signUp, true);

    expect(authService.signOut(), isA<void>());
  });
}
