import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:searchack/screens/search/search_screen.dart';

void main() {
  testWidgets('HackCard increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await mockNetworkImagesFor(
      () async {
        return await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: HackCard(
                title: 'Test',
                imageLink:
                    'https://www.oxfordwebstudio.com/user/pages/06.da-li-znate/sta-je-link/sta-je-link.jpg',
                description: 'desc',
                address: 'address',
                prizeFundAmount: 500,
                sponsorName: 'sponsor',
                companyOrganizer: 'company',
                startDate: 'date',
                endDate: 'date',
              ),
            ),
          ),
        );
      },
    );

    expect(find.text('Test'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('desc'), findsOneWidget);
    // expect(find.text('Призовой фонд: 500 рублей'), findsOneWidget);
    // expect(find.text('sponsor'), findsOneWidget);
    // expect(find.text('company'), findsOneWidget);
    // expect(find.text('date'), findsNWidgets(2));
  });
}
