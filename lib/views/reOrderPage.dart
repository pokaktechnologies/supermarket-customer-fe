import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';

class Reorderpage extends StatelessWidget {
  const Reorderpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.black,
          child: const Center(
            child: Text(
              "Reorder page",
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
