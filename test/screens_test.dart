import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_mathematics/app/theme.dart';
import 'package:life_mathematics/providers/history_provider.dart';
import 'package:life_mathematics/providers/shell_provider.dart';
import 'package:life_mathematics/screens/calculator_screen.dart';
import 'package:life_mathematics/screens/smart_calculators_screen.dart';
import 'package:provider/provider.dart';

Widget _host(Widget child) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ChangeNotifierProvider(create: (_) => ShellProvider()),
    ],
    child: MaterialApp(
      theme: AppTheme.darkTheme,
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('CalculatorScreen evaluates a sum', (tester) async {
    await tester.pumpWidget(_host(const CalculatorScreen()));
    await tester.pump();

    await tester.tap(find.bySemanticsLabel('9'));
    await tester.tap(find.bySemanticsLabel('Add'));
    await tester.tap(find.bySemanticsLabel('6'));
    await tester.tap(find.bySemanticsLabel('Equals'));
    await tester.pump();

    expect(find.text('15'), findsOneWidget);
    expect(find.text('9 + 6 ='), findsOneWidget);
  });

  testWidgets('SmartCalculatorsScreen lists every calculator', (tester) async {
    await tester.pumpWidget(_host(const SmartCalculatorsScreen()));
    await tester.pump();

    expect(find.text('Choose a calculator'), findsOneWidget);
    expect(find.text('Compound\nInterest'), findsOneWidget);
    expect(find.text('Loan\nPayoff'), findsOneWidget);
    expect(find.text('EMI\nCalculator'), findsOneWidget);
    expect(find.text('Investment\nReturns'), findsOneWidget);
  });
}
