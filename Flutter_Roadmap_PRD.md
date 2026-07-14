# Flutter Roadmap — Product Requirements Document (PRD)
### Version 1.0 | Prepared for Antigravity Full-Project Generation

---

## 1. Executive Summary

**Product Name:** Flutter Roadmap

**One-line pitch:** A gamified, offline-first Flutter learning platform that takes a developer from zero to expert through a structured, checkbox-driven roadmap, with quizzes, notes, streaks, and achievements — styled in a bold Neo-Brutalist visual language.

**Platform:** Android (Play Store), built with Flutter.

**Target audience:** Self-taught and university-level Flutter/Dart learners (primary persona: CS/SE students preparing for internships — mobile-first, low/mid-spec Android devices, intermittent internet).

**Core value proposition:**
1. Structured curriculum (119+ topics) instead of scattered YouTube tutorials.
2. Built-in note-taking, code examples, and quizzes per topic — no app-switching.
3. Gamification (XP, streaks, badges, certificates) to sustain motivation.
4. Fully offline-capable after first sync.

**Why Neo-Brutalism:** The learning-app market (Duolingo, SoloLearn, Mimo) is saturated with soft, rounded, pastel "Corporate Memphis" UIs. Neo-Brutalism differentiates this app visually in the Play Store, signals "serious/technical/no-nonsense," and pairs naturally with code-editor aesthetics (monospace, high contrast, hard edges) that a developer-focused audience already trusts.

---

## 2. Goals & Non-Goals

### Goals
- Ship a Play-Store-ready MVP covering the 30-screen flow already scoped.
- Local-first data model (SQLite via `sqflite` or `drift`) — app must be fully usable with zero internet after install.
- Consistent, enforced design system — every screen pulls from shared tokens, not one-off styles.
- Support incremental content updates (new topics/quizzes) without requiring a full app update.

### Non-Goals (explicitly out of scope for v1)
- iOS release (Android-only for v1).
- User accounts / cloud sync / multi-device — v1 is single-device, local-storage only.
- Social features (leaderboards, friends, sharing progress publicly).
- Paid tiers / in-app purchases — v1 is free, monetization deferred to v2.
- AI-chatbot tutoring (that belongs to a separate product; not to be conflated with this app).

---

## 3. Tech Stack & Architecture

| Layer | Choice | Rationale |
|---|---|---|
| Framework | Flutter (latest stable) | Cross-platform, matches learner's own stack |
| State management | Riverpod (`flutter_riverpod`) | Testable, scalable past MVP, avoids `setState` sprawl across 30 screens |
| Local DB | `drift` (SQLite wrapper) | Type-safe queries, migrations support, better than raw `sqflite` for 119-topic relational data |
| Navigation | `go_router` | Declarative routing, deep-linking ready, clean drawer/back-stack handling |
| Code syntax highlighting | `flutter_highlight` or `re_highlight` | For Topic → Code tab |
| Charts | `fl_chart` | Statistics screen (weekly/monthly/heatmap) |
| Animations | `flutter_animate` + native `AnimationController` for bespoke "push/lift" interactions | Needed for neo-brutalist mechanical press/lift effects |
| Fonts | `Space Grotesk` (via `google_fonts` package or bundled `.ttf`) | Per design system |
| Icons | `lucide_icons` (Flutter port of lucide-react) | Matches design system's icon spec |
| Local notifications | `flutter_local_notifications` | Streak reminders, daily challenge nudge |
| Persistence beyond DB | `shared_preferences` | Theme toggle, onboarding-seen flag, simple settings |

**Architecture pattern:** Feature-first folder structure (`/features/dashboard`, `/features/roadmap`, `/features/quiz`, etc.), each with `data/`, `domain/`, `presentation/` layers. Shared design system lives in `/core/design_system/` (tokens, components, theme).

---

## 4. Design System — Neo-Brutalism (Flutter Adaptation)

This section translates the web-oriented Neo-Brutalism spec into Flutter-native tokens. This is the **single source of truth** — every screen must consume these, never hardcode values.

### 4.1 Color Tokens (`app_colors.dart`)
```dart
class AppColors {
  static const background = Color(0xFFFFFDF5); // Cream canvas
  static const ink        = Color(0xFF000000); // Pure black — all borders/text
  static const accent     = Color(0xFFFF6B6B); // Hot red — primary actions
  static const secondary  = Color(0xFFFFD93D); // Vivid yellow — secondary/highlight
  static const muted      = Color(0xFFC4B5FD); // Soft violet — tertiary/depth
  static const white      = Color(0xFFFFFFFF);

  // Semantic
  static const success = Color(0xFF6BCB77); // completed states, XP gain
  static const danger  = accent;            // reuse hot red for destructive actions
}
```
Rule: no greys. Ever. Disabled states use black at fixed opacity (`ink.withOpacity(0.3)`) only where absolutely necessary — never a hex grey.

### 4.2 Typography (`app_text_styles.dart`)
- Font: `Space Grotesk` — weights 400 (rare), 500, 700, 900 only.
- Scale (mapped from web `rem` to Flutter `sp`, adjusted for mobile viewport):
  - Display: 48–64sp, weight 900, `letterSpacing: -1.5`
  - H2: 32–40sp, weight 900
  - H3: 24–28sp, weight 700
  - Body Large: 18–20sp, weight 700
  - Body: 15–16sp, weight 500
  - Label/Caption: 12–13sp, weight 700, `letterSpacing: 1.5`, uppercase

### 4.3 Borders, Radius, Shadow
```dart
class AppBorders {
  static const thin   = 2.0;
  static const dflt   = 4.0; // signature thickness
  static const thick  = 8.0;
}

class AppRadius {
  static const sharp = 0.0;   // default everywhere
  static const pill  = 999.0; // badges, circular stickers only
}

// Hard offset shadow — implemented via BoxDecoration + Positioned/Stack
// since Flutter's BoxShadow always has blur; zero-blur hard shadow requires
// custom Stack: solid black container behind, offset by X/Y, foreground on top.
class HardShadow {
  static const small   = Offset(4, 4);
  static const medium  = Offset(8, 8);
  static const large   = Offset(12, 12);
  static const massive = Offset(16, 16);
}
```
**Implementation note for Antigravity:** Flutter's native `BoxShadow` always blurs. Build a reusable `NeoBrutalContainer` widget that renders the hard shadow as a solid black `Container` positioned behind the content via `Stack`, offset by the token values above — this is the correct way to achieve true zero-blur shadows in Flutter, not `BoxShadow(blurRadius: 0)` (which still anti-aliases).

### 4.4 Core Reusable Components (build once, reuse everywhere)
1. **`NeoButton`** — variants: `primary` (red), `secondary` (yellow), `outline` (white), `ghost`. Must implement the **press-down mechanical effect**: on tap-down, translate content by `(shadowOffset.dx, shadowOffset.dy)` and remove shadow; on release, animate back. Duration 100ms, `Curves.linear`.
2. **`NeoCard`** — 4 sub-variants per spec: Hero Card, Information Card, List Card, Action Card. All share: `border: 4px black`, `radius: 0`, hard shadow (default `medium`). Optional lift-on-tap animation (`translateY(-4)` + shadow grows to `large`).
3. **`NeoBadge`** — pill or square, colored background, thick border, optional rotation (`transform: rotate(3deg)` equivalent via `Transform.rotate`), used for XP badges, priority tags, "New" markers.
4. **`NeoInput`** — thick border, sharp corners, on-focus background flips to `secondary` yellow + shadow appears (no glow/ring).
5. **`NeoAppBar`** — fixed across all screens: leading (back or search icon), title (bold uppercase), trailing (notification bell + profile avatar, both bordered squares).
6. **`NeoDrawer`** — fixed width (never resizes, spec value: `280dp`), same 12-item structure on every screen (see §6).
7. **`TextureBackground`** — wrapper widget applying one of the 6 texture types (halftone dots / grid / noise) via `CustomPainter` or repeating `AssetImage` pattern, since Flutter can't use raw CSS `radial-gradient` background-image tricks directly — must be painted.

### 4.5 Motion Tokens
- Button press: 100ms, linear.
- Card lift / hover-equivalent (on tap for mobile, since no hover): 200–300ms, `Curves.easeOut`.
- Decorative star/badge idle rotation: 10s loop, linear, `Curves.linear`, respects a `reduceMotion` setting stored in `shared_preferences`.

---

## 5. Screen-by-Screen Specification

All screens: fixed canvas reference **1242×2688px** design frame (scales responsively via `MediaQuery`), fixed `NeoDrawer` (never resizes), fixed `NeoAppBar` unless explicitly stated otherwise (Splash and Onboarding have no AppBar/Drawer).

| # | Screen | Key Components Used | Data Source | Notes |
|---|---|---|---|---|
| 001 | Splash | Logo, `NeoBrutalContainer` progress bar, tagline | Local asset + init DB check | Auto-navigates after DB init + min 1.5s display |
| 002–004 | Onboarding 1–3 | Hero illustration, `NeoButton`, dot indicator, selectable `NeoCard` (learning-style cards) | `shared_preferences` (onboarding_seen flag, selected_level) | Skip writes default level = Beginner |
| 005 | Dashboard | `NeoDrawer`, `NeoAppBar` w/ search, Hero Card (Continue Learning), Info Cards (XP/Level/Streak), List Card (Recent Activity) | DB: `user_progress`, `topics`, `activity_log` | Entry point post-onboarding and every subsequent app open |
| 006 | Roadmap Overview | Search bar, filter chips, sort dropdown, Expand/Collapse All buttons, List Cards (collapsed roadmap sections) | DB: `roadmap_sections`, `topics` | Search filters across topic titles live |
| 007 | Roadmap Expanded | Same as 006 + one Action Card expanded with description/progress/groups | DB query filtered by `section_id` | Accordion: only one section open at a time |
| 008 | Group Expanded | Expanded topic-group list, checkboxes, `NeoBadge` (priority), Add Note button per topic | DB: `topic_groups`, `topics.completed` | Checkbox state syncs immediately to DB |
| 009 | Topic Overview | Hero Card, tab bar (`Overview`/`Code`/`Notes`/`Resources`), Complete button | DB: `topics`, `topic_content` | Tabs are `TabBarView`, not separate routes |
| 010 | Topic — Code | Syntax-highlighted code block (`flutter_highlight`), Copy/Run buttons | DB: `topic_code_examples` (bundled JSON, seeded) | "Run" opens read-only DartPad web view or shows disabled state in v1 |
| 011 | Topic — Notes | Notebook-style `NeoInput` multiline, markdown toolbar, Save/Delete, char counter | DB: `user_notes` (topic_id FK) | Autosave debounce 2s + explicit Save button |
| 012 | Topic — Resources | List Cards (Docs/YouTube/Medium/GitHub/StackOverflow links), bookmark toggle | DB: `topic_resources` (seeded), `bookmarks` (user table) | External links open via `url_launcher` |
| 013 | Topic Completed | Full-screen success overlay, confetti (`confetti` package), XP badge, Completed state | DB write: `topics.completed = true`, `user_xp += 25` | Triggers Next Topic button |
| 014 | Next Topic Loaded | Auto-navigates within Topic Overview shell to next `topic_id` in sequence | DB: sequential topic query by `order_index` | No new route — content swap only |
| 015 | Roadmap Updated | Roadmap Overview re-rendered with updated green/completed state + notification dot on Dashboard drawer item | DB read (reactive via Riverpod provider) | Confirms state propagation across screens |
| 016 | Dashboard Updated | Dashboard re-rendered: Continue Learning card, Recent Activity, XP | Same as 005, reactive rebuild | No new screen — proves single source of truth |
| 017 | Daily Challenge | Info Card (goal/reward/difficulty), Start button | DB: `daily_challenges` (seeded, rotates by date) | One challenge active per calendar day |
| 018 | Quiz | Question card, 4 answer options, countdown timer widget, progress bar | DB: `quiz_questions` (seeded per topic/challenge) | Timer uses `AnimationController`, auto-submits at 0 |
| 019 | Quiz Result | Score/accuracy/XP summary, badge reveal | Computed client-side from quiz session | Writes to `user_xp`, `quiz_history` |
| 020 | Achievements | Badge grid, "Level Up" banner + animation on new unlock | DB: `achievements` (rules-based, evaluated on XP/streak change) | Achievement-check runs as a service on every XP/topic-complete event |
| 021 | Statistics | `fl_chart` weekly/monthly bar charts, heatmap (custom `GridView` + color intensity), completion %, hours | DB: `activity_log` aggregated queries | Heatmap = last 90 days minimum |
| 022 | Bookmarks | Filterable list of bookmarked topics/resources, folder grouping | DB: `bookmarks` | Empty state → Screen 028 |
| 023 | Resources Library | Categorized browse (Docs/Packages/Videos/Articles), search, category chips | DB: `topic_resources` (global view, not per-topic) | |
| 024 | Search (global) | Search-active state, suggestions, recent searches, trending, results list | DB full-text query across `topics`, `resources` | Recent searches stored in `shared_preferences` |
| 025 | Profile | Avatar (local image picker or preset avatar set), XP/Level, achievements grid, hours, streak, bookmarks count | DB aggregate + `shared_preferences` (avatar choice) | |
| 026 | Settings | Theme toggle (note: v1 is single-theme per §2 Non-Goals — this becomes a stub/disabled toggle or removed), Export/Import/Backup (local JSON export of DB), Reset, About | DB export/import via `drift` + file picker | Export = write DB to JSON in app documents dir, shareable |
| 027 | Certificate | Completion certificate (rendered as styled widget → exported as image/PDF), Share, Download | Triggered when `overall_progress == 100%` | Use `screenshot` package to rasterize widget, `pdf` package to generate PDF |
| 028 | Empty State | Illustration + message, reused across Bookmarks/Notes/Search-no-results contexts | N/A — pure UI state | Single reusable `NeoEmptyState` widget with configurable icon/text |
| 029 | Offline Mode | No-internet banner, Retry button, confirmation that offline learning still works | `connectivity_plus` package for detection | Should rarely block anything since app is local-first — this screen is mainly for resource-links/external-content contexts |
| 030 | About App | Version (from `package_info_plus`), developer credit, license, GitHub link, privacy note | Static content | |

---

## 6. Drawer Structure (Fixed, Global)

```
[Logo — bordered box, accent background]
─────────────────────────────
Dashboard
Roadmap
Topics
Daily Challenge
Quiz
Achievements
Statistics
Bookmarks
Resources
Settings
Profile
─────────────────────────────
[XP Card — sticky bottom: current XP + level + mini progress bar]
```
- Width: fixed `280dp`, never resizes across any screen.
- Active route highlighted with `secondary` (yellow) background block + left accent bar.
- Implemented via `go_router`'s `ShellRoute` so drawer + app bar persist across navigation without rebuild flicker.

---

## 7. Data Model (Core Tables)

```
topics(id, section_id, group_id, title, description, order_index, completed, priority)
roadmap_sections(id, title, description, order_index)
topic_groups(id, section_id, title, order_index)
topic_content(topic_id, overview_md, code_example, resources_json)
user_notes(id, topic_id, content_md, updated_at)
user_xp(id, total_xp, level, current_streak, last_active_date)
achievements(id, title, description, unlocked, unlocked_at, rule_key)
bookmarks(id, ref_type, ref_id, folder)
quiz_questions(id, topic_id OR challenge_id, question, options_json, correct_index)
quiz_history(id, quiz_id, score, accuracy, xp_earned, taken_at)
daily_challenges(id, date, goal, reward_xp, difficulty)
activity_log(id, date, topics_completed, minutes_spent, xp_earned)
```
Seeded content (119 topics, questions, resources) ships as bundled JSON in `assets/seed_data/`, imported into `drift` DB on first launch only.

---

## 8. Non-Functional Requirements

- **Performance:** Cold start < 2s on a mid-range device (reference: Ryzen-class desktop dev machine is irrelevant here — test target should be a device roughly equivalent to a 3–4 year old mid-range Android phone, e.g. 4GB RAM, since the target audience is students, not flagship-device owners).
- **Offline-first:** Zero network calls required for core learning flow (roadmap, notes, quizzes, XP). Only external resource links (YouTube/Docs/GitHub) require connectivity.
- **Accessibility:** All interactive elements ≥ 44×44dp touch target (per design system's own accessibility section). Text contrast must pass WCAG AA even with the high-saturation palette — validate red-on-cream and black-on-yellow combinations specifically.
- **App size:** Target under 40MB (seed data is text/JSON, not media-heavy) to keep Play Store install-friction low for the target demographic's often-limited mobile data.
- **Crash-free rate target:** >99% (standard Play Store health threshold before Play Console starts restricting visibility).

---

## 9. Play Store Readiness Checklist

- [ ] Privacy Policy page (required even for local-only apps if requesting any permission — notifications count).
- [ ] Data Safety form completion (declare: no data collected / no data leaves device, since v1 has no backend).
- [ ] App icon (adaptive icon, 512×512 + foreground/background layers).
- [ ] Feature graphic (1024×500) — should reflect Neo-Brutalist branding for store consistency.
- [ ] Screenshots (min 2, recommend 6–8) — capture actual in-app screens 005, 009, 018, 020, 021, 027 as they show the most differentiated UI.
- [ ] Content rating questionnaire.
- [ ] Target API level compliance (check current Play Store minimum `targetSdkVersion` requirement at submission time — this shifts yearly).
- [ ] Signed release build (`.aab`, not `.apk`) with proper keystore backup.
- [ ] Internal testing track → closed testing (12+ testers, 14 days minimum per current Play Console policy) before production release — **note: Google's testing requirements for new developer accounts change periodically; verify current requirement before submission timeline planning.**

---

## 10. Open Questions / Decisions Needed Before Antigravity Build

These are genuine gaps in the current spec that will cause inconsistent output if left unresolved — recommend deciding before generation, not after:

1. **Settings → Dark Mode toggle** contradicts the "single definitive light mode palette" rule in the design system. Either drop this control from Screen 026, or explicitly scope a dark variant (not currently specified anywhere in the design tokens).
2. **Avatar system (Profile screen):** preset illustration set, or device photo picker? Affects whether `image_picker` + storage permission is needed.
3. **Certificate export format:** image (PNG) share vs. PDF — affects package choice and whether a share-sheet or file-save flow is built.
4. **Quiz question volume:** how many questions exist per topic/challenge — affects seed data size and whether questions repeat/rotate.
5. **119 topics content:** who authors the actual overview/code-example/resource-link content for all 119 topics? This is the single largest content-creation bottleneck in the entire project — no PRD or AI code-generation tool can originate accurate, correct educational content at this volume without human technical review.

---

## 11. Realistic Scope Note

This PRD is intentionally exhaustive so that Antigravity (or any coding agent) has minimal ambiguity per screen. That said: a 30-screen, 119-topic, gamified, offline-first app with a fully custom design system is a genuinely multi-week build even with strong AI assistance — not a single-session output. The realistic path is:

1. Generate `/core/design_system/` first (tokens + reusable components) as its own milestone — validate it renders correctly before any screen is built on top of it.
2. Generate screens in the grouped batches already established (Splash → Onboarding → Dashboard/Roadmap → Topic detail → Gamification → Profile/Settings), reviewing each batch before moving to the next.
3. Treat the 119-topic content population as a separate content-authoring track, decoupled from UI/code generation.

This sequencing will produce a materially better result than attempting the entire scope in one generation pass, regardless of how detailed the initiating prompt is.
