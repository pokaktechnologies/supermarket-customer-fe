import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';

void showThemeDialog(BuildContext context) {
  String selectedTheme = 'Light';

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          Widget customRadio(String value, String label, bool isBold) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontWeight:
                            isBold ? FontWeight.bold : FontWeight.normal,
                        color: isBold ? AppColors.black : AppColors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Radio<String>(
                    value: value,
                    groupValue: selectedTheme,
                    onChanged: (val) {
                      setState(() {
                        selectedTheme = val!;
                      });
                    },
                    activeColor: AppColors.green,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            );
          }

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            content: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 400, maxWidth: 500),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customRadio('Dark', 'Dark', false),
                  customRadio('Light', 'Light', true),
                  customRadio('System', 'System', false),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Go Back',
                            style: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w600)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Confirm',
                            style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
