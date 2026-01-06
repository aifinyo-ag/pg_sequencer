# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-01-06

**Maintainer Change:** This version marks the fork maintained by [aifinyo AG](https://www.aifinyo.de), building upon the excellent work of the original [code42/pg_sequencer](https://github.com/code42/pg_sequencer) and [sixtyfive/pg_sequencer](https://github.com/sixtyfive/pg_sequencer).

### Breaking Changes
- **Ruby:** Minimum required version increased from 2.7.8 to 3.2.0
- **Rails:** Minimum required version increased from 6.1.0 to 8.0.0
- **PostgreSQL:** Dropped support for PostgreSQL < 10 (versions 15-17 tested)

### Added
- PostgreSQL 17.4 compatibility verified
- Ruby 3.4 and 4.0 compatibility
- GitHub Actions CI with comprehensive matrix testing (Ruby 3.2/3.3/3.4 × Rails 8.0/8.1 × PostgreSQL 15/16/17)
- SQL injection protection using `quote()` for sequence names

### Fixed
- Schema dumper `owned_by` option now properly handles nil values
- Schema dumper tests uncommented and working
- Tests now use flexible expectations for better maintainability

### Changed
- Upgraded `pg` gem dependency to >= 1.6.0 for PostgreSQL 18 future-proofing
- Upgraded `rspec` development dependency to ~> 3.13
- Simplified PostgreSQL version handling (removed conditional logic for < 10)
- Switched from `.tool-versions` to `.ruby-version`

### Removed
- Travis CI configuration (migrated to GitHub Actions)
- PostgreSQL < 10 support code

## [1.0.5] - Previous Release

Historical releases maintained compatibility with Ruby 2.7.8+, Rails 6.1+, and PostgreSQL 9.0+.
