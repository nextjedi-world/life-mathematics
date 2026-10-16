import 'package:flutter_test/flutter_test.dart';
import 'package:life_mathematics/utils/telemetry.dart';

void main() {
  test('Sentry is off when no SENTRY_DSN is defined', () {
    expect(Telemetry.sentryDsn, isEmpty);
    expect(Telemetry.sentryEnabled, isFalse);
  });

  test('run calls the app body directly without a DSN', () async {
    var ran = false;
    await Telemetry.run(() => ran = true);
    expect(ran, isTrue);
  });

  test('log accepts fields, errors and non-JSON values', () {
    expect(
      () => Telemetry.log(
        'calculator_used',
        fields: {'calculator': 'emi', 'at': DateTime(2026)},
        level: 'error',
        error: StateError('boom'),
      ),
      returnsNormally,
    );
  });
}
