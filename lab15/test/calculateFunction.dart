import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/main.dart';

void main() {
  group('Function calculation tests', () {
    test('Calculate y = x - 15x^2', () {
      final appState = CalculatorAppState();

      // Тестуємо функцію для різних значень x
      expect(appState.calculateFunction(0), 0.0);       // y = 0 - 15 * 0^2 = 0
      expect(appState.calculateFunction(1), -14.0);      // y = 1 - 15 * 1^2 = -14
      expect(appState.calculateFunction(2), -58.0);      // y = 2 - 15 * 2^2 = -58
      expect(appState.calculateFunction(-1), 14.0);      // y = -1 - 15 * (-1)^2 = 14
    });
  });

  group('Widget tests', () {
    testWidgets('Checks for text with pattern <Group>: <Name>\'s last Flutter App', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text("KN-32 Roman's last Flutter App"), findsOneWidget);
    });

    testWidgets('Checks for FloatingActionButton with Icons.person', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      final icon = find.descendant(of: fab, matching: find.byIcon(Icons.person));
      expect(icon, findsOneWidget);
    });

    testWidgets('Checks for counter reset after tapping FloatingActionButton', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Вводимо значення x
      final textField = find.byType(TextField);
      await tester.enterText(textField, '3');
      await tester.pump();

      // Перевіряємо результат
      expect(find.text('Result: -132.0'), findsOneWidget);

      // Тапаємо на FloatingActionButton для скидання
      final fab = find.byType(FloatingActionButton);
      await tester.tap(fab);
      await tester.pump();

      // Перевіряємо, чи результат скинуто
      expect(find.text('Result: 0.0'), findsOneWidget);
    });
  });
}
