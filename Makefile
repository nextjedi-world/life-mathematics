# Repo contract (nextjedi-world/platform docs/CONTRACTS.md): setup, dev, verify, e2e.
# `make verify` is what CI and the Claude Stop hook run. It must stay green.
# Flutter is not installed on every dev machine; CI (.github/workflows/ci.yml) is the source of truth.
FLUTTER ?= flutter
DART ?= dart
DART_DIRS := lib test

.DEFAULT_GOAL := help
.PHONY: help setup deps dev verify format-check analyze test build e2e format clean

help: ## List targets
	@grep -E '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "  %-14s %s\n", $$1, $$2}'

setup: deps ## Install packages, git hooks (lefthook, if installed) and .env from .env.example
	@if command -v lefthook >/dev/null 2>&1; then lefthook install; else echo "lefthook not installed: skipping git hooks (npm i -g lefthook / brew install lefthook)"; fi
	@test -f .env || cp .env.example .env

deps: ## flutter pub get
	$(FLUTTER) pub get

dev: deps ## Run the app on the connected device, simulator or emulator
	$(FLUTTER) run

format-check: ## Fail if Dart code is not formatted
	$(DART) format --output=none --set-exit-if-changed $(DART_DIRS)

analyze: ## flutter analyze (flutter_lints + analysis_options.yaml)
	$(FLUTTER) analyze --no-pub

test: ## Unit + widget tests with coverage (coverage/lcov.info)
	$(FLUTTER) test --no-pub --coverage

build: ## Debug Android build (no signing needed)
	$(FLUTTER) build apk --debug --no-pub

verify: deps format-check analyze test build ## Format check, analyze, tests with coverage, debug APK build

e2e: deps ## No integration_test suite yet; runs the widget smoke tests
	$(FLUTTER) test --no-pub test/widget_test.dart

format: ## Auto-format Dart code
	$(DART) format $(DART_DIRS)

clean: ## Remove build outputs
	$(FLUTTER) clean
