import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retina/screens/home.dart';

void main() {
  testWidgets('Home screen title semantics', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(),
      ),
    );
    expect(find.text('RETINA'), findsOneWidget);    
  });
}
