# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0](https://github.com/nextjedi-world/life-mathematics/compare/life_mathematics-v0.1.1...life_mathematics-v0.2.0) (2026-10-16)


### Features

* Add CI/CD pipeline with Fastlane for Android, iOS, and macOS ([e3da22b](https://github.com/nextjedi-world/life-mathematics/commit/e3da22b7485aa72f3207a88d526f80567c66196e))
* Add iOS platform support and app icon ([04a3a51](https://github.com/nextjedi-world/life-mathematics/commit/04a3a517b202167214ad9c10461c49b14e19a35e))
* Add macOS platform support and app icon ([3df9a67](https://github.com/nextjedi-world/life-mathematics/commit/3df9a673ca8d48acf221381d99ab73d2f3a51dbd))
* migrate to centralized flutter-deploy.yml template in apps-ops ([3b0eb80](https://github.com/nextjedi-world/life-mathematics/commit/3b0eb80209685ba0f2fdb1df0351f24992a74bb1))
* redesign with Calculus Dark theme + compound interest & history ([681febb](https://github.com/nextjedi-world/life-mathematics/commit/681febb6107946190f7f28bcbccd0f200fdec22c))
* smart calculators, running tape, and exploratory-testing fixes ([740d75b](https://github.com/nextjedi-world/life-mathematics/commit/740d75b593dab61dd8c1e39835c00c535a778d53))


### Bug Fixes

* Add pipeline caching and fix gem write permissions on Ubuntu ([bcb8013](https://github.com/nextjedi-world/life-mathematics/commit/bcb801378980ff7ba131de9a1d4ccf5bc7bf4af4))
* Change CardTheme to CardThemeData for Flutter compatibility ([adead39](https://github.com/nextjedi-world/life-mathematics/commit/adead3934bd4c3d1889fc50a4ea4c43b5f77ac4d))
* **ci:** remove unsupported --no-codesign flag from flutter build macos ([aedac62](https://github.com/nextjedi-world/life-mathematics/commit/aedac62a51242009c377d85bb464446124087461))
* **ci:** replace deprecated withOpacity with withValues to pass flutter analyze ([7e1576c](https://github.com/nextjedi-world/life-mathematics/commit/7e1576c55f24476324476e89938e7bf020c06908))
* **ci:** resolve pipeline issues and add calculator display enhancements ([939e2fa](https://github.com/nextjedi-world/life-mathematics/commit/939e2fae57858b9841ccae85e61eb55492c47b8f))
* correct mac_installer.p12 filename and add Mac Installer cert signing step ([be60eb3](https://github.com/nextjedi-world/life-mathematics/commit/be60eb3af4a9f86fd56ee21ba8756b22e93f6189))
* Remove invalid optional param from app_store_connect_api_key ([630ca51](https://github.com/nextjedi-world/life-mathematics/commit/630ca51de1568514bfe982a5e6333e49eaa8d1f5))
* remove provisioningProfile param — iOS now uses automatic signing ([a2c1afa](https://github.com/nextjedi-world/life-mathematics/commit/a2c1afa44341903eb796d397919643112cc9ffc5))
* Resolve all flutter analyze warnings and errors ([4c7a4ba](https://github.com/nextjedi-world/life-mathematics/commit/4c7a4ba1a6c0a453c8d9aa9ec43186235396d0bc))
* Resolve Pod signing conflict and missing bundler on CI ([624481d](https://github.com/nextjedi-world/life-mathematics/commit/624481d24b81d106b5a342fbfa9670b200cfa79c))
* Split Flutter install step so PATH is set before flutter commands run ([8400ecc](https://github.com/nextjedi-world/life-mathematics/commit/8400ecc0dcd08ad79efaed30a7d61bd0c3ebec48))
* Update secure file names to match actual uploaded filenames in Azure DevOps ([5eb33ee](https://github.com/nextjedi-world/life-mathematics/commit/5eb33ee27502388028721c6917e80946a34a8f27))
* Wire up manual code signing for iOS and macOS CI builds ([9d61d1c](https://github.com/nextjedi-world/life-mathematics/commit/9d61d1c505870d21db8c0f63eab5d744640b250d))

## [Unreleased]

### Added
- Project setup with comprehensive documentation
- MIT License
- Contributing guidelines
- Setup instructions for Flutter development
- Detailed requirements analysis
- Issue tracking document
- Basic project structure

### Changed
- Initial repository setup

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A

## [0.1.0] - 2025-01-29

### Added
- Initial project structure
- Documentation files (README, SETUP, REQUIREMENTS, CONTRIBUTING)
- Open source license (MIT)
- Git repository initialization
- Issue templates and tracking

---

## Release Notes Template

Use this template for future releases:

## [Version] - YYYY-MM-DD

### Added
- New features

### Changed
- Changes in existing functionality

### Deprecated
- Soon-to-be removed features

### Removed
- Removed features

### Fixed
- Bug fixes

### Security
- Security fixes
