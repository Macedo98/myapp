import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PerguntasApp());

    expect(find.text('Qual a sua cor favorita?'), findsOneWidget);
  });
}
