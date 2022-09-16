import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neyasischallenge/features/accounts/view/accounts_view.dart';

void main() {
  group('Widget Test - AccountsView ', () {
    testWidgets('testing scroll', (tester) async {
      const String fullNameListFirst = 'Ömer Kaan';
      await tester.pumpWidget(const AccountsView());
      expect(find.text(fullNameListFirst), findsOneWidget);
      await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text(fullNameListFirst), findsNothing);
    });
  });
}
