import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../core/app_theme.dart';

// ═══════════════════════════════════════════════════════
// GEO CONTAINER — "The Sticker Card"
// ═══════════════════════════════════════════════════════
// Chunky 2px border, hard offset shadow, bouncy hover.
// This is the fundamental building block.

class GeoContainer extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool enableHoverLift;
  final VoidCallback? onTap;
  final double borderRadius;
  final double borderWidth;

  const GeoContainer({
    super.key,
    required this.child,
    this.backgroundColor = AppColors.bgSecondary,
    this.shadowColor,
    this.padding,
    this.margin,
    this.enableHoverLift = false,
    this.onTap,
    this.borderRadius = AppTheme.radiusMd,
    this.borderWidth = AppTheme.borderDefault,
  });

  @override
  State<GeoContainer> createState() => _GeoContainerState();
}

class _GeoContainerState extends State<GeoContainer> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    
    Widget container = AnimatedContainer(
      duration: AppTheme.animNormal,
      curve: AppTheme.bouncyCurve,
      margin: widget.margin,
      padding: widget.padding,
      transform: _isPressed ? Matrix4.diagonal3Values(0.98, 0.98, 1.0) : Matrix4.identity(),
      transformAlignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.backgroundColor == AppColors.bgPrimary ? Colors.transparent : widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border, width: 1.0),
        boxShadow: widget.enableHoverLift && _isPressed
            ? [
                BoxShadow(
                  color: AppColors.accent.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
      child: widget.child,
    );

    if (widget.onTap != null || widget.enableHoverLift) {
      container = MouseRegion(
        cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTapDown: (_) {
            if (widget.onTap != null) HapticFeedback.lightImpact();
            setState(() => _isPressed = true);
          },
          onTapUp: (_) {
            setState(() => _isPressed = false);
            if (widget.onTap != null) widget.onTap!();
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: container,
        ),
      );
    }

    return container;
  }
}

// ═══════════════════════════════════════════════════════
// GEO BUTTON — "The Candy Button"
// ═══════════════════════════════════════════════════════
// Pill-shaped, chunky border, hard shadow, bouncy press.

class GeoButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? textColor;
  final bool isFullWidth;
  final IconData? icon;

  const GeoButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.accent,
    this.textColor,
    this.isFullWidth = false,
    this.icon,
  });

  @override
  State<GeoButton> createState() => _GeoButtonState();
}

class _GeoButtonState extends State<GeoButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isGhost = widget.backgroundColor == Colors.transparent || 
                    widget.backgroundColor == AppColors.bgSecondary ||
                    widget.backgroundColor == AppColors.bgPrimary;
    
    final effectiveTextColor = widget.textColor ?? (isGhost ? AppColors.text : AppColors.white);

    Widget buttonContent = AnimatedContainer(
      duration: AppTheme.animNormal,
      curve: AppTheme.bouncyCurve,
      transform: _isPressed ? Matrix4.diagonal3Values(0.96, 0.96, 1.0) : Matrix4.identity(),
      transformAlignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: widget.backgroundColor == AppColors.accent 
            ? (_isHovered ? AppColors.accent.withValues(alpha: 0.8) : AppColors.accent)
            : (_isHovered ? AppColors.bgTertiary : widget.backgroundColor),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: widget.backgroundColor == AppColors.accent ? Colors.transparent : AppColors.border,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon, color: effectiveTextColor, size: 18),
            const SizedBox(width: 8),
          ],
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: effectiveTextColor,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() { _isHovered = false; _isPressed = false; }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) {
          HapticFeedback.lightImpact();
          setState(() => _isPressed = true);
        },
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: buttonContent,
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
// GEO BADGE — Pill-shaped label
// ═══════════════════════════════════════════════════════

class GeoBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double angle;

  const GeoBadge({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.angle = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor == AppColors.bgPrimary ? Colors.transparent : backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
          width: 1.5,
        ),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontFamily: 'SpaceGrotesk',
          fontWeight: FontWeight.w800,
          color: textColor,
          letterSpacing: 2.0,
        ),
      ),
    );

    if (angle != 0.0) {
      return Transform.rotate(
        angle: angle * 3.14159 / 180,
        child: badge,
      );
    }

    return badge;
  }
}

// ═══════════════════════════════════════════════════════
// FLOATING SHAPE — Decorative geometric element
// ═══════════════════════════════════════════════════════
// Circle, triangle, square — the "confetti" of the UI.

class FloatingShape extends StatelessWidget {
  final double size;
  final Color color;
  final ShapeType shape;
  final double rotation;

  const FloatingShape({
    super.key,
    this.size = 24,
    this.color = AppColors.accent,
    this.shape = ShapeType.circle,
    this.rotation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
          borderRadius: shape == ShapeType.circle
              ? BorderRadius.circular(size)
              : shape == ShapeType.roundedSquare
                  ? BorderRadius.circular(size * 0.25)
                  : BorderRadius.zero,
        ),
      ),
    );
  }
}

enum ShapeType { circle, square, roundedSquare }

// ═══════════════════════════════════════════════════════
// LEGACY ALIASES — Keep old code compiling
// ═══════════════════════════════════════════════════════

// These redirect old widget names to new geometric widgets.
class NeoContainer extends GeoContainer {
  const NeoContainer({
    super.key,
    required super.child,
    super.backgroundColor,
    super.padding,
    super.margin,
    super.enableHoverLift,
    super.onTap,
    double shadowOffset = 4.0,
  }) : super(borderRadius: AppTheme.radiusMd);
}

class NeoButton extends GeoButton {
  const NeoButton({
    super.key,
    required super.text,
    required super.onPressed,
    super.backgroundColor,
    super.isFullWidth,
    super.icon,
    super.textColor,
  });
}

class NeoBadge extends GeoBadge {
  const NeoBadge({
    super.key,
    required super.text,
    required super.backgroundColor,
    required super.textColor,
    super.angle,
  });
}
