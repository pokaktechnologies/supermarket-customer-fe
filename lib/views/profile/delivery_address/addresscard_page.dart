import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';

class AddressCard extends StatelessWidget {
  final String label, address;

  const AddressCard({super.key, required this.label, required this.address});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.location_on_outlined;
    if (label.toUpperCase() == 'HOME') {
      icon = Icons.home_outlined;
    } else if (label.toUpperCase() == 'WORK') {
      icon = Icons.work_outline;
    }

    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.black),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(address,
                      style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.darkgrey,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const Row(
              children: [
                Icon(Icons.edit, color: AppColors.greenbuttonColor),
                SizedBox(height: 8),
                Icon(Icons.delete_outline, color: AppColors.greenbuttonColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
