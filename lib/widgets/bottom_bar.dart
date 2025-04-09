import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.grey),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleBottomBarItem(
                image: AppAssets.homeIcon,
                text: "Home",
              ),
              SingleBottomBarItem(
                image: AppAssets.categoryIcon,
                text: "Category",
              ),
              SingleBottomBarItem(
                image: AppAssets.aiIcon,
                text: "AI",
              ),
              SingleBottomBarItem(
                image: AppAssets.reOrderIcon,
                text: "Reorder",
              ),
              SingleBottomBarItem(
                image: AppAssets.offerIcon,
                text: "Offers",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleBottomBarItem extends StatelessWidget {
  final String image;
  final String text;
  const SingleBottomBarItem({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 50,
      child: Column(
        children: [
          Image.asset(
            image,
            width: 20,
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
