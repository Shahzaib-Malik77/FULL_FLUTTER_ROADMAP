# Phase 2: Redesign Specification

## 1. Layout & Grid System
*   **Base Unit:** 8pt grid.
*   **Horizontal Padding:** Fixed at `24px` globally for outer margins (replacing the current mix of 12/16/20px).
*   **Vertical Rhythm:** 
    *   32px between major sections (e.g., Search to Progress).
    *   24px between Topic Groups.
    *   8px between individual items within a group.

## 2. Typography Scale
*   **Headers (Space Grotesk):** Weight increased to `w900` for macro-headers.
*   **Body/Notes:** Line height increased to `1.5`. (Retaining Space Grotesk to avoid bringing in new font files, but utilizing `w500` and tracking adjustments).
*   **Badges/Metadata:** `letterSpacing: 1.0` applied to all uppercase micro-copy to improve legibility.

## 3. Color System (Refined Brutalism)
*   **Off-Black:** Pure black (`#000000`) is replaced with `#141414`. It retains the starkness but eliminates halation and eyestrain.
*   **Paper White:** The muddy cream (`#FFFDF5`) is shifted to `#FAFAFA`, offering higher contrast and a cleaner, premium commercial feel.
*   **Accent Restraint:** Brand colors (Yellow, Red, Violet) will be used more intentionally for states and active elements, ensuring a 7:1 contrast ratio against the off-black.

## 4. Animation & Interaction System
*   **Tactile Physics:** Buttons and active states will translate `Offset(4, 4)` downwards while dropping their shadow from `4x4` to `0x0`, creating a perfect mechanical "press" illusion.
*   **Haptics:** `HapticFeedback.lightImpact()` on all presses, and `HapticFeedback.heavyImpact()` on topic completion.
*   **Expansion:** Topic groups will open with a stiff spring animation, not a default linear slide.

---

# Phase 3: Design Principles

1.  **Structural Clarity Over Border Soup:** Borders define containers and major UI boundaries. We will remove 4px borders from *interior* micro-elements (like checkboxes inside already bordered containers) to reduce cognitive load.
2.  **Mechanical Feedback:** If it looks like a physical sticker or button, it must move and feel like one.
3.  **Typographic Hierarchy:** Scale, weight, and spacing dictate importance, not just color.
4.  **Preserve the Identity:** We are *not* moving to Apple HIG or Glassmorphism. We are building the most polished, premium version of your specific Brutalist identity.

---

# Phase 4: Implementation Plan

I am executing the implementation right now per your command. I will update files in this order to prevent breaking the build:

1.  **`lib/theme/app_colors.dart`** - Update global tokens to the premium Off-Black and Paper White.
2.  **`lib/widgets/neo_brutalist_widgets.dart`** - Add haptics, refine the mechanical push animations, and adjust padding proportions.
3.  **`lib/main.dart`** - Fix global typography settings and input decorations.
4.  **`lib/screens/home_screen.dart`** - Clean up the grid, fix search bar bleed, restructure the filter chips, and animate the progress bar.
5.  **`lib/screens/dashboard_screen.dart`** - Fix the bottom navigation sizing and active state indicators.
6.  **`lib/screens/roadmap_screen.dart`** - Adjust expansion physics and nested item alignment.
