# Life Mathematics

All-purpose calculator app in Flutter: a basic calculator with a running tape, plus "smart
calculators" for compound interest, loan payoff, EMI and investment returns, and a calculation
history. Offline only (shared_preferences + sqflite); no accounts, payments or backend.

- Product id: `life-mathematics` (`NEXTJEDI_PRODUCT`). Dart package `life_mathematics`.
  Android/iOS id `com.nextjedi.lifemathematics`.
- Stack: `flutter` (NextJedi Studio Platform, github.com/nextjedi-world/platform). Public repo
  github.com/nextjedi/life-mathematics.
- Linear: project "Life Mathematics", team NEX. Platform adoption: NEX-1111.

## Commands (the repo contract)
| Command | Does |
|---|---|
| `make setup` | `flutter pub get`, lefthook git hooks (if installed), `.env` from `.env.example` |
| `make dev` | `flutter run` on the connected device / simulator |
| `make verify` | `dart format` check, `flutter analyze`, `flutter test --coverage`, `flutter build apk --debug`. **CI and the Stop hook run this; it must pass.** |
| `make e2e` | widget smoke tests (no `integration_test/` suite yet) |
| `make format` | `dart format lib test` |
| `make test` / `make analyze` / `make format-check` / `make build` | the single steps of `verify` |

Raw equivalents: `flutter pub get`, `dart format lib test` (not the removed `flutter format`),
`flutter analyze`, `flutter test --coverage`, `flutter run`.

Flutter is not installed on every machine. If `flutter` is missing, say so and rely on CI
(`.github/workflows/ci.yml`, Flutter 3.38.x, the version `pubspec.lock` was resolved with)
instead of claiming `make verify` passed. Docker works: `ghcr.io/cirruslabs/flutter:3.38.4`.

Release builds and store uploads: Fastlane lanes in `android/fastlane` (`internal`, `beta`,
`production`), `ios/fastlane` and `macos/fastlane` (`beta`, `release`), run today by
`azure-pipelines.yml` (template `flutter-deploy.yml` in nextjedi/apps-ops). Moving them to GitHub
Actions is NEX-1138. See `docs/FASTLANE_SETUP.md` and `docs/DEVOPS_PLAYBOOK.md`.

## Layout
```
lib/
  main.dart              entry point, theme toggle, HomePage with floating nav + IndexedStack
  app/theme.dart         AppTheme + AppPalette ("Calculus Dark" / light), context.palette
  app/layout.dart        shared layout constants (floating nav sizes)
  providers/             HistoryProvider (sqflite history), ShellProvider (tab + restore hand-off)
  screens/               calculator, smart_calculators, compound_interest, loan_calculator,
                         emi_calculator, investment_returns, history, settings
  utils/                 calculator_logic (precedence, tape), finance (all money maths),
                         money (formatting), database_helper (sqflite), telemetry (Sentry + logs)
  widgets/               calculator_button, finance_widgets, app_snackbar
test/                    calculator_logic_test, finance_test, widget_test, screens_test, telemetry_test
docs/                    setup, requirements, Fastlane, DevOps playbook, troubleshooting, old issue list
```

## Rules
- Branch from the Linear issue, conventional commits (lefthook checks), PR body has `Fixes NEX-123`.
- `make verify` green before you say you are done. Never weaken a lint rule or delete a test to get green.
- Money and arithmetic logic lives in plain Dart in `lib/utils/` (`calculator_logic.dart`,
  `finance.dart`) and is unit tested; change it only with tests. Widgets get widget tests.
- Use `context.palette` colours, not hard-coded ones; test light and dark themes.
- Tap targets at least 48x48 dp; keep the 4x5 keypad layout responsive; every button has a
  Semantics label (tests find buttons by label, e.g. `find.bySemanticsLabel('Add')`).
- New packages: latest stable that resolves with the pinned Flutter; commit `pubspec.lock`.
- Telemetry: crash reporting and structured logs go through `lib/utils/telemetry.dart`.
  Sentry only starts when built with `--dart-define=SENTRY_DSN=...`; with no DSN nothing leaves the device.
- iOS/macOS builds only run on the Mac. Do not claim they work unless built there.

## Do not touch
- `android/key.properties`, `android/app/upload-keystore.jks*`, any `*.p8`, `*.p12`, provisioning
  profiles, `.env`. Never print, read or commit signing material (the repo is public).
- `azure-pipelines.yml`, `.azure/` (retirement is NEX-1019) and the shared templates in nextjedi/apps-ops.
- Fastlane lanes, unless the issue is about releases.

## Design decisions
- Material 3 with a custom palette (`AppPalette` theme extension); dark is the default theme.
- Provider for state: `HistoryProvider` and `ShellProvider`; screens stay alive in an
  `IndexedStack` so a running calculation survives tab switches.
- History is stored in sqflite; settings (theme) in shared_preferences.
- The keypad sits behind a frosted floating nav (`Stack` with `StackFit.expand`; that fit is load-bearing).

## More docs
`README.md` (features), `CONTRIBUTING.md`, `CHANGELOG.md` (release-please keeps it), and `docs/`:
`SETUP.md`, `QUICK_START.md`, `REQUIREMENTS.md`, `TROUBLESHOOTING.md`, `FASTLANE_SETUP.md`,
`DEVOPS_PLAYBOOK.md`, `PLAY_STORE_SCREENSHOTS.md`, `GITHUB_SETUP.md`, `PUSH_TO_GITHUB.md`,
`PROJECT_SUMMARY.md`, `ISSUES.md` (historical; Linear is the tracker now).

## Claude Code specifics
- `.claude/settings.json` enables the `nextjedi` marketplace (nextjedi-world/platform) and plugin
  `nextjedi-core` (Stop hook runs `make verify`, protected paths, Linear workflow skills).
  There is no Flutter stack plugin yet. The platform repo is private: loading the plugins needs a
  GitHub login that can read it.
- CI workflows are inlined (this public repo cannot call the private platform's reusable
  workflows); keep them in sync with `nextjedi-world/platform/.github/workflows/`.
- Claude review / @claude workflows skip until the repo variable `CLAUDE_REVIEW_ENABLED` is `true`.
