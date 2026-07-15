# Premium Visual Specification
**Codename: Workspace Zero**

This document outlines the complete architectural redesign of the Flutter Roadmap application. We are abandoning the Neo-Brutalist aesthetic entirely. The new design language is heavily inspired by the ultra-refined, professional, and elegant interfaces of Linear, Raycast, and Notion. 

It is designed to be a "Workspace" rather than a toy app—a premium commercial product worthy of a Google Play Editor's Choice award.

---

## 1. Design Philosophy
*   **Invisible UI:** The interface should recede, letting the user's progress and content take center stage.
*   **Precision over Punch:** We trade thick borders and hard shadows for math-perfect alignments, sub-pixel borders, and multi-layered soft shadows.
*   **Desktop-Class Architecture:** Built desktop-first with a responsive breakpoint system, translating complex layouts into elegant mobile views.

---

## 2. Global Tokens

### Typography (Inter)
We will use Google's `Inter` typeface for maximum legibility and neutrality.
*   **Display / Hero:** 32px, Weight 600 (Semi-bold), Tracking -1.0px.
*   **H1 (Section Headers):** 20px, Weight 600 (Semi-bold), Tracking -0.5px.
*   **Body (Primary):** 15px, Weight 400 (Regular), Line Height 1.5.
*   **Body (Secondary / Notes):** 14px, Weight 400, Line Height 1.6, Color: Muted.
*   **Micro (Badges / Metadata):** 12px, Weight 500 (Medium).

### Color System (Light Mode)
A strictly controlled palette to emulate high-end macOS and web apps.
*   **App Background:** `#F8F9FA` (Ultra-soft cool gray).
*   **Card Surface:** `#FFFFFF` (Pure white).
*   **Primary Accent:** `#0F172A` (Slate 900) for primary buttons, creating a stark, high-end contrast.
*   **Secondary Accent (Progress):** A subtle, sophisticated gradient from `#6366F1` (Indigo) to `#8B5CF6` (Violet).
*   **Text Primary:** `#111827` (Deep Gray, avoids the harshness of pure black).
*   **Text Secondary:** `#6B7280` (Muted Gray).
*   **Borders / Dividers:** `#E5E7EB` (Subtle 1px lines).

### Shape & Depth
*   **Radii:** 
    *   Macro containers (Hero, Modals): `24px`
    *   Standard cards (Topics, Groups): `16px`
    *   Micro elements (Badges, small buttons): `8px` or `999px` (Pills).
*   **Shadows:** We use composite (layered) shadows for realistic depth.
    *   *Hover/Elevation 1:* `BoxShadow(color: black(0.04), blur: 8, offset: (0,4)), BoxShadow(color: black(0.02), blur: 3, offset: (0,1))`

---

## 3. Structural Redesign (Desktop & Mobile)

### Navigation Architecture
*   **Desktop / Tablet (> 800px):** 
    *   A fixed **Left Sidebar** containing Dashboard, Roadmap, Bookmarks, and Settings.
    *   The sidebar background is `#F3F4F6` and blends seamlessly into the window edge.
*   **Mobile (< 800px):** 
    *   A floating, frosted-glass bottom navigation bar (`BackdropFilter` with `sigmaX: 10, sigmaY: 10`) resting 16px above the screen bottom, leaving the content to scroll beautifully behind it.

### The Search Experience (Raycast Style)
*   **The Component:** The search bar is no longer a standard text field. It is a large, pill-shaped "Command Input" at the top of the feed (`height: 56px`, `borderRadius: 28px`), featuring a subtle inner shadow.
*   **Interaction:** Tapping it opens a full-screen or modal **Command Palette** with a blurred background, allowing instantaneous keyboard-driven filtering.

### Hero & Statistics Section
*   **Current Flaw:** The stats look like generic boxes.
*   **New Design:** A single, massive, beautifully padded Hero Card (`padding: 32px`, `borderRadius: 24px`).
*   **Progress Visualization:** A razor-thin `4px` progress track with a smooth, glowing gradient fill. The percentage text uses a monospaced variant for tabular lining, animating smoothly on change.

### The Roadmap (Topic Groups & Cards)
*   **Current Flaw:** Disconnected boxes with harsh borders.
*   **New Design:** 
    *   Topic groups are visually grouped into single, continuous white surface cards (`borderRadius: 16px`).
    *   Instead of individual borders, items are separated by `1px` `#E5E7EB` internal dividers.
    *   **Expansion:** Expanding a group uses a buttery smooth `SizeTransition` with an `easeOutCubic` curve. The content slides down effortlessly like a Notion block.
    *   **Checkboxes:** Custom, subtle circles. When checked, they fill with a checkmark and the row text smoothly transitions to `#9CA3AF` (strikethrough).

### Note-Taking System
*   **Current Flaw:** Clunky outlined text fields that clutter the UI.
*   **New Design:** Clicking "Add Note" opens an **Inline Editor**. The text field is borderless, blending completely into a very faint gray nested container (`#F3F4F6`). It auto-expands gracefully. It feels like typing directly onto a piece of paper.

---

## 4. Animation & Micro-interactions
*   **Hover States (Desktop):** All interactive elements smoothly transition their background color (e.g., `#FFFFFF` to `#F9FAFB`) over `150ms`.
*   **Press States (Mobile/Touch):** Tapping a card shrinks it to `0.98` scale over `100ms`, rebounding on release. 
*   **Loading:** No more blank screens. We use shimmering skeleton loaders built with elegant gradient sweeps to match the exact dimensions of the final content.

---

### Conclusion
This specification completely abandons "gimmick" design trends and commits to the timeless, high-usability standards used by the world's most elite software teams.

**Please review this visual specification. Upon your approval, I will systematically rewrite the Flutter architecture to implement this exact vision pixel-perfectly.**
