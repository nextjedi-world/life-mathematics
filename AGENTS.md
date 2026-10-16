# Life Mathematics: agent guide

Read [CLAUDE.md](CLAUDE.md). It is the single source for this repo's commands, layout, rules and
the files agents must not touch. The short version:

- Product id `life-mathematics`, stack Flutter, Linear team NEX.
- `make setup`, `make dev`, `make verify` (must pass before you finish), `make e2e`.
- Conventional commits; PR body has `Fixes NEX-123`.
- Never read, print or commit signing material (`android/key.properties`, `*.jks*`, `*.p8`,
  `*.p12`) or `.env`. The repo is public.
