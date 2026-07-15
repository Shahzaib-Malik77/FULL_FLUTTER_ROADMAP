import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/roadmap_models.dart';

class ProgressPanelLayout {
  static const double imageWidth = 1368.0;
  static const double imageHeight = 638.0;
  static const double aspectRatio = imageWidth / imageHeight;

  static const Rect progressRect = Rect.fromLTWH(
    105 / imageWidth,
    128 / imageHeight,
    965 / imageWidth,
    60 / imageHeight,
  );
  static const Rect percentageRect = Rect.fromLTWH(
    1086 / imageWidth,
    128 / imageHeight,
    177 / imageWidth,
    60 / imageHeight,
  );

  static const double _slotY = 521 / imageHeight;
  static const double _slotW = 240 / imageWidth;
  static const double _slotH = 44 / imageHeight;

  static const Rect topicsRect = Rect.fromLTWH(
    88 / imageWidth,
    _slotY,
    _slotW,
    _slotH,
  );
  static const Rect doneRect = Rect.fromLTWH(
    404 / imageWidth,
    _slotY,
    _slotW,
    _slotH,
  );
  static const Rect leftRect = Rect.fromLTWH(
    720 / imageWidth,
    _slotY,
    _slotW,
    _slotH,
  );
  static const Rect notesRect = Rect.fromLTWH(
    1036 / imageWidth,
    _slotY,
    _slotW,
    _slotH,
  );

  static const double _labelY = 390 / imageHeight;
  static const double _labelW = 240 / imageWidth;
  static const double _labelH = 110 / imageHeight;

  static const Rect topicsLabelRect = Rect.fromLTWH(
    88 / imageWidth,
    _labelY,
    _labelW,
    _labelH,
  );
  static const Rect doneLabelRect = Rect.fromLTWH(
    404 / imageWidth,
    _labelY,
    _labelW,
    _labelH,
  );
  static const Rect leftLabelRect = Rect.fromLTWH(
    720 / imageWidth,
    _labelY,
    _labelW,
    _labelH,
  );
  static const Rect notesLabelRect = Rect.fromLTWH(
    1036 / imageWidth,
    _labelY,
    _labelW,
    _labelH,
  );

  // Mathematically derived from the source PNG asset (1368x638) using PIL analysis.
  // We use the exact groove cutouts from the brass texture to anchor our overlays.
  // The grooves are centered at Y=297, X=207, 523, 841, 1156.
  // To completely cover the groove, we use a larger 160x160 solid plaque centered at these coordinates.
  static const IconSquare topicsSquare = IconSquare(
    left: 120.0,
    top: 215.0,
    width: 160.0,
    height: 250.0,
  );
  static const IconSquare doneSquare = IconSquare(
    left: 450.0,
    top: 215.0,
    width: 150.0,
    height: 250.0,
  );
  static const IconSquare leftSquare = IconSquare(
    left: 758.0,
    top: 215.0,
    width: 150.0,
    height: 250.0,
  );
  static const IconSquare notesSquare = IconSquare(
    left: 1070.0,
    top: 215.0,
    width: 150.0,
    height: 250.0,
  );
}

class IconSquare {
  final double left;
  final double top;
  final double width;
  final double height;

  const IconSquare({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });
}

class RoadmapProgressPanel extends StatelessWidget {
  final ValueNotifier<RoadmapProgressState> progressNotifier;

  const RoadmapProgressPanel({super.key, required this.progressNotifier});

  Widget _buildAnimatedNumberOverlay(
    Rect rect,
    num targetValue,
    double w,
    double h, {
    String suffix = "",
    bool isDecimal = false,
  }) {
    return Positioned(
      left: w * rect.left,
      top: h * rect.top,
      width: w * rect.width,
      height: h * rect.height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: targetValue.toDouble(),
            end: targetValue.toDouble(),
          ),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutExpo,
          builder: (context, value, child) {
            String displayValue = isDecimal
                ? value.toStringAsFixed(1)
                : value.toInt().toString();
            return Text(
              "$displayValue$suffix",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
    );
  }

  Widget _buildLabelOverlay(Rect rect, String text, double w, double h) {
    return Positioned(
      left: w * rect.left,
      top: h * rect.top,
      width: w * rect.width,
      height: h * rect.height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 14, // Decreased size for better fit
            fontWeight: FontWeight.w800, // Heavier weight
            color: Colors.white,
            letterSpacing: 1.8, // Match industrial AAA UI
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.9),
                offset: const Offset(1, 2),
                blurRadius: 3,
              ),
              Shadow(
                color: Colors.black.withValues(alpha: 0.5),
                offset: const Offset(0, 1),
                blurRadius: 1,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildIconOverlay(
    IconSquare square,
    String assetPath,
    double w,
    double h,
  ) {
    // 1. Calculate relative square placement (anchoring to the detected PNG frame)
    final double relativeLeft = square.left / ProgressPanelLayout.imageWidth;
    final double relativeTop = square.top / ProgressPanelLayout.imageHeight;
    final double relativeWidth = square.width / ProgressPanelLayout.imageWidth;
    final double relativeHeight =
        square.height / ProgressPanelLayout.imageHeight;

    // 2. Icon size calculation: We want the solid icon to completely fill its bounds.
    final double targetPixelSize = square.width;

    // 3. Convert target size to relative scale
    final double relativeIconSizeX =
        targetPixelSize / ProgressPanelLayout.imageWidth;
    final double relativeIconSizeY =
        targetPixelSize / ProgressPanelLayout.imageHeight;

    return Positioned(
      left: w * relativeLeft,
      top: h * relativeTop,
      width: w * relativeWidth,
      height: h * relativeHeight,
      // The container acts as the precise detected square frame.
      child: Align(
        alignment: Alignment
            .center, // Mathematically centers the icon within the square frame
        child: SizedBox(
          width: w * relativeIconSizeX,
          height: h * relativeIconSizeY,
          child: Image.asset(
            assetPath,
            fit: BoxFit.contain, // Keep original aspect ratio, no stretching
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ProgressPanelLayout.aspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          return ValueListenableBuilder<RoadmapProgressState>(
            valueListenable: progressNotifier,
            builder: (context, state, child) {
              return Stack(
                children: [
                  Positioned(
                    left: w * ProgressPanelLayout.progressRect.left,
                    top: h * ProgressPanelLayout.progressRect.top,
                    width: w * ProgressPanelLayout.progressRect.width,
                    height: h * ProgressPanelLayout.progressRect.height,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: Curves.easeOutQuad.transform(
                            state.progressPercent,
                          ),
                          end: Curves.easeOutQuad.transform(
                            state.progressPercent,
                          ),
                        ),
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) {
                          return ClipRect(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              widthFactor: value,
                              child: child,
                            ),
                          );
                        },
                        child: SizedBox(
                          width: w * ProgressPanelLayout.progressRect.width,
                          height: h * ProgressPanelLayout.progressRect.height,
                          child: Image.asset(
                            'assets/progress_bar.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Image.asset(
                      'assets/progress_asset.png',
                      fit: BoxFit.fill,
                    ),
                  ),

                  _buildAnimatedNumberOverlay(
                    ProgressPanelLayout.percentageRect,
                    state.progressPercent * 100,
                    w,
                    h,
                    suffix: "%",
                    isDecimal: true,
                  ),
                  _buildAnimatedNumberOverlay(
                    ProgressPanelLayout.topicsRect,
                    state.totalTopics,
                    w,
                    h,
                  ),
                  _buildAnimatedNumberOverlay(
                    ProgressPanelLayout.doneRect,
                    state.completedTopics,
                    w,
                    h,
                  ),
                  _buildAnimatedNumberOverlay(
                    ProgressPanelLayout.leftRect,
                    state.leftTopics,
                    w,
                    h,
                  ),
                  _buildAnimatedNumberOverlay(
                    ProgressPanelLayout.notesRect,
                    state.notedTopics,
                    w,
                    h,
                  ),

                  _buildIconOverlay(
                    ProgressPanelLayout.topicsSquare,
                    'assets/icon_topics.png',
                    w,
                    h,
                  ),
                  _buildIconOverlay(
                    ProgressPanelLayout.doneSquare,
                    'assets/icon_done.png',
                    w,
                    h,
                  ),
                  _buildIconOverlay(
                    ProgressPanelLayout.leftSquare,
                    'assets/icon_remaining.png',
                    w,
                    h,
                  ),
                  _buildIconOverlay(
                    ProgressPanelLayout.notesSquare,
                    'assets/icon_notes.png',
                    w,
                    h,
                  ),

                  _buildLabelOverlay(
                    ProgressPanelLayout.topicsLabelRect,
                    "TOPICS",
                    w,
                    h,
                  ),
                  _buildLabelOverlay(
                    ProgressPanelLayout.doneLabelRect,
                    "DONE",
                    w,
                    h,
                  ),
                  _buildLabelOverlay(
                    ProgressPanelLayout.leftLabelRect,
                    "REMAINING",
                    w,
                    h,
                  ), // Changed LEFT to REMAINING
                  _buildLabelOverlay(
                    ProgressPanelLayout.notesLabelRect,
                    "NOTES",
                    w,
                    h,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
