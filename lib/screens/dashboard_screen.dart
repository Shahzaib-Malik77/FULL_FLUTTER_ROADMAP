import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'roadmap_screen.dart';
import 'bookmarks_screen.dart';
import 'statistics_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const RoadmapScreen(),
    const BookmarksScreen(),
    const StatisticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          border: const Border(
            top: BorderSide(color: AppColors.text, width: 3),
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.text,
              offset: Offset(0, -4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.map, 'ROADMAP'),
            _buildNavItem(1, Icons.bookmark, 'BOOKMARKS'),
            _buildNavItem(2, Icons.bar_chart, 'STATS'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 16 : 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accentYellow : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.text, width: 2),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: AppColors.text,
                    offset: Offset(3, 3),
                  ),
                ]
              : const [
                  BoxShadow(
                    color: AppColors.text,
                    offset: Offset(1, 1),
                  ),
                ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.text,
              size: 24,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
