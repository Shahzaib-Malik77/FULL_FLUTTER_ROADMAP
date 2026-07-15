import sys

file_path = 'lib/screens/home_screen.dart'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

old_str = """                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: (w * ProgressPanelLayout.progressRect.width) * progressPercent,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: AppColors.accent,
                                    ),
                                  ),
                                ),"""

new_str = """                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0, end: progressPercent),
                                  duration: const Duration(milliseconds: 300),
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
                                  child: Image.asset(
                                    'assets/progress_bar.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),"""

if '\r\n' in content:
    old_str = old_str.replace('\n', '\r\n')
    new_str = new_str.replace('\n', '\r\n')

if old_str in content:
    content = content.replace(old_str, new_str)
    
    # Also revert styles in _buildTextOverlay and _buildLabelOverlay
    content = content.replace("color: const Color(0xFFE5B976),", "color: Colors.white,")
    content = content.replace("fontSize: h * 0.055,", "fontSize: h * 0.04,")
    content = content.replace("fontSize: h * 0.028,", "fontSize: h * 0.025,")
    content = content.replace("fontWeight: FontWeight.w900,", "fontWeight: FontWeight.w700,")
    content = content.replace("fontWeight: FontWeight.w800,", "fontWeight: FontWeight.w700,")
    content = content.replace("color: const Color(0xFFE5B976).withOpacity(0.9),", "color: Colors.white,")
    
    # Also revert label positions
    content = content.replace("static const double _labelY = 640 / imageHeight;", "static const double _labelY = 738 / imageHeight;")
    content = content.replace("static const double _labelH = 30 / imageHeight;", "static const double _labelH = 25 / imageHeight;")
    
    with open(file_path, 'w', encoding='utf-8', newline='') as f:
        f.write(content)
    print('Updated home_screen.dart successfully.')
else:
    print('Error: Target string not found.')
