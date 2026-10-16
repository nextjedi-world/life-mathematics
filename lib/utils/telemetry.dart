import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Crash reporting and structured logging.
///
/// Everything is configured at build time with `--dart-define` (see
/// `.env.example`). With no `SENTRY_DSN` the app runs exactly as before:
/// Sentry is never initialised and nothing leaves the device.
class Telemetry {
  Telemetry._();

  /// Product id from the NextJedi platform contract.
  static const String product = 'life-mathematics';

  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN');

  static const String environment = String.fromEnvironment(
    'SENTRY_ENVIRONMENT',
    defaultValue: kReleaseMode ? 'prod' : 'dev',
  );

  static bool get sentryEnabled => sentryDsn.isNotEmpty;

  /// Runs [appRunner], wrapped in Sentry only when a DSN was provided.
  static Future<void> run(FutureOr<void> Function() appRunner) async {
    if (!sentryEnabled) {
      await appRunner();
      return;
    }
    await SentryFlutter.init(
      (options) {
        options.dsn = sentryDsn;
        options.environment = environment;
        options.sendDefaultPii = false;
      },
      appRunner: appRunner,
    );
  }

  /// One structured log line: a JSON object with `product`, `level`,
  /// `message` and any extra [fields]. Shows in `flutter logs` / DevTools.
  static void log(
    String message, {
    String level = 'info',
    Map<String, Object?> fields = const {},
    Object? error,
    StackTrace? stackTrace,
  }) {
    final record = <String, Object?>{
      'product': product,
      'level': level,
      'message': message,
      ...fields,
    };
    developer.log(
      jsonEncode(record, toEncodable: (value) => value.toString()),
      name: product,
      level: _levels[level] ?? 800,
      error: error,
      stackTrace: stackTrace,
    );
    if (sentryEnabled && error != null) {
      unawaited(Sentry.captureException(error, stackTrace: stackTrace));
    }
  }

  // package:logging levels, which DevTools understands.
  static const Map<String, int> _levels = {
    'debug': 500,
    'info': 800,
    'warning': 900,
    'error': 1000,
  };
}
