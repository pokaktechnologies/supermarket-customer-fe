import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';
import 'package:supermarket_fe/core/utils/navigations.dart';
import 'package:supermarket_fe/views/profile/notification/notificationItem_page.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: AppColors.appbarColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GestureDetector(
                onTap: () {
                  popNavigation(context);
                },
                child: Image.asset(AppAssets.arrowbackIcon)),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'Notifications',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(height: 10),
          NotificationItem(
            title: 'Delivered',
            subtitle: 'Hybrid Tomato, Broccoli, Dark chocolate',
            time: '02:12pm',
            titleWidget: Row(
              children: [
                Text(
                  'Delivered',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.check_circle,
                  size: 17,
                  color: AppColors.greenbuttonColor,
                )
              ],
            ),
          ),
          Divider(height: 1),
          NotificationItem(
            title: '50% Off on Grocery',
            subtitle: 'Hybrid Tomato, Broccoli, & More...',
            time: '02:12pm',
            actionText: 'SHOP NOW',
            actionColor: AppColors.orange,
          ),
        ],
      ),
    );
  }
}
