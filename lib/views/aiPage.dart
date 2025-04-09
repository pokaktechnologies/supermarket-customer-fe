import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';

class Aipage extends StatelessWidget {
  const Aipage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.brown,
          child: const Center(
            child: Text(
              "AI page",
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
