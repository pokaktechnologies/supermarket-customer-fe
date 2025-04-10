import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsTile({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 8),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
          collapsedIconColor: AppColors.black,
          iconColor: AppColors.black,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          children: children,
        ),
      ),
    );
  }
}
