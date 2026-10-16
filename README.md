# Life Mathematics 🧮

A comprehensive, all-purpose calculator app built with Flutter for everyday calculations, financial planning, and mathematical operations.

[![ci](https://github.com/nextjedi/life-mathematics/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/nextjedi/life-mathematics/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B.svg?logo=flutter)](https://flutter.dev)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

## Features

### 📱 Basic Calculator
- Standard arithmetic operations (+, -, ×, ÷)
- Decimal precision support
- Memory functions (MS, MR, M+, M-, MC)
- Percentage calculations
- Clean, modern UI with native feel

### 💰 Financial Calculators

#### Compound Interest Calculator
- Multiple compounding frequencies (annually, monthly, daily, continuous)
- Visual growth charts
- Year-by-year breakdown
- Compare different compounding scenarios

#### Loan Calculator
- Monthly payment calculator
- Remaining balance calculator
- Full amortization schedule
- Impact analysis of extra payments
- Export to PDF/CSV

#### EMI Calculator
- Interactive sliders for inputs
- Real-time calculation
- Principal vs Interest breakdown
- Year-wise payment schedule

#### Simple Interest Calculator
- Quick calculations for short-term loans
- Comparison with compound interest

#### Investment Return Calculator
- ROI and CAGR calculations
- SIP/recurring investment support
- Break-even analysis

### 📊 Additional Features
- Percentage calculator (discounts, tips, changes)
- Calculation history with search
- Dark mode support
- Multiple themes
- Customizable number formatting
- Multi-currency support
- Responsive design (mobile, tablet, web)

## Screenshots

[Coming soon]

## Installation

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart 3.0 or higher

See [SETUP.md](docs/SETUP.md) for detailed installation instructions.

### Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/life-mathematics.git
cd life-mathematics

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Release

Store uploads run from GitHub Actions, workflow `store-release` (`.github/workflows/store-release.yml`).
It uses the fastlane lanes in `android/fastlane` and `ios/fastlane` on GitHub-hosted runners
(ubuntu for Android, macos for iOS). Tags created with the default token do not start workflows, so either
set the `RELEASE_TOKEN` secret to a PAT (release-please then tags and triggers the upload) or dispatch by hand.

```bash
# Play internal + TestFlight (also what a pushed v* tag does)
gh workflow run store-release.yml -R nextjedi-world/life-mathematics -f track=internal -f platforms=both
# Play open testing + TestFlight
gh workflow run store-release.yml -R nextjedi-world/life-mathematics -f track=beta
# Play production + App Store Connect upload (not submitted for review)
gh workflow run store-release.yml -R nextjedi-world/life-mathematics -f track=production
```

The Android version code comes from `pubspec.yaml` (`version: x.y.z+build`); iOS takes the next TestFlight
build number automatically. If secrets are missing, that platform is skipped and the run summary lists the
missing names.

Repository secrets (names only, never commit values):

| Platform | Secret |
|---|---|
| Android | `ANDROID_KEYSTORE_BASE64` (base64 of the upload keystore), `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_PASSWORD`, `PLAY_SERVICE_ACCOUNT_JSON` (raw JSON) |
| iOS | `ASC_KEY_ID`, `ASC_ISSUER_ID`, `ASC_KEY_P8_BASE64`, `IOS_DIST_CERT_P12_BASE64`, `IOS_DIST_CERT_PASSWORD`, `IOS_PROVISIONING_PROFILE_BASE64` |

Optional repository variable: `ANDROID_KEY_ALIAS` (default `lifemathematics`).

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── app/
│   ├── theme/               # App themes and styling
│   └── routes/              # Navigation routes
├── models/                   # Data models
│   ├── calculation.dart
│   ├── loan.dart
│   └── investment.dart
├── screens/                  # UI screens
│   ├── basic_calculator/
│   ├── compound_interest/
│   ├── loan_calculator/
│   ├── emi_calculator/
│   └── settings/
├── widgets/                  # Reusable widgets
│   ├── calculator_button.dart
│   ├── number_pad.dart
│   └── result_display.dart
├── utils/                    # Helper functions
│   ├── calculator_logic.dart
│   ├── financial_formulas.dart
│   └── formatters.dart
└── services/                 # Services
    ├── history_service.dart
    └── settings_service.dart
```

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details on:
- How to report bugs
- How to suggest features
- Pull request process
- Code style guidelines

## Requirements

See [REQUIREMENTS.md](docs/REQUIREMENTS.md) for detailed functional and technical requirements.

## Roadmap

### Phase 1 (MVP) - In Progress
- [x] Project setup
- [x] Documentation
- [ ] Basic calculator implementation
- [ ] Simple interest calculator
- [ ] Compound interest calculator
- [ ] Settings and themes
- [ ] History feature

### Phase 2
- [ ] Loan calculator with amortization
- [ ] EMI calculator
- [ ] Percentage calculator suite
- [ ] Enhanced UI/UX
- [ ] Onboarding flow

### Phase 3
- [ ] Investment return calculator
- [ ] Export functionality (PDF, CSV)
- [ ] Localization (multiple languages)
- [ ] Accessibility improvements

### Phase 4
- [ ] Scientific calculator
- [ ] Unit conversions
- [ ] Currency converter with live rates
- [ ] Cloud sync (optional)

## Technologies Used

- **Framework**: Flutter 3.0+
- **Language**: Dart 3.0+
- **State Management**: [Provider/Riverpod/Bloc] (TBD)
- **Local Storage**: shared_preferences / Hive
- **UI**: Material Design 3 / Cupertino
- **Charts**: fl_chart / charts_flutter
- **Testing**: flutter_test, mockito

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- All contributors and users
- Open source community

## Contact & Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/life-mathematics/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/life-mathematics/discussions)
- **Email**: your.email@example.com

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history and updates.

---

Made with ❤️ using Flutter

⭐ Star this repo if you find it helpful!
