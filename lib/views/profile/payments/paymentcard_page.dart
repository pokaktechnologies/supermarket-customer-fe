import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';

class PaymentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;

  final VoidCallback onCardTap;

  const PaymentCard({
    super.key,
    required this.icon,
    required this.title,
    required this.items,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black54),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onCardTap,
                  child: const Icon(Icons.add, color: AppColors.orange),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...List.generate(items.length, (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          items[index],
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Icon(Icons.delete_outline, color: Colors.green),
                    ],
                  ),
                  if (index != items.length - 1)
                    const Divider(
                      color: AppColors.grey,
                      thickness: 0.4,
                      height: 16,
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
