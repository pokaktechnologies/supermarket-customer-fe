import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String? actionText;
  final Color? actionColor;
  final Widget? trailing;
  final Widget? titleWidget;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.actionText,
    this.actionColor,
    this.trailing,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: titleWidget ??
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    if (actionText != null)
                      Text(
                        actionText!,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: actionColor ?? Colors.blue,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 8),
            trailing!,
          ],
        ],
      ),
    );
  }
}
