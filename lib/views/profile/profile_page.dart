import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';
import 'package:supermarket_fe/core/utils/navigations.dart';
import 'package:supermarket_fe/views/profile/delivery_address/address_page.dart';
import 'package:supermarket_fe/views/profile/edit_profile_page.dart';
import 'package:supermarket_fe/views/profile/notification/notification_page.dart';
import 'package:supermarket_fe/views/profile/orders/pastorder_page.dart';
import 'package:supermarket_fe/views/profile/payments/payment_page.dart';
import 'package:supermarket_fe/views/profile/settings/settings_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    ),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
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
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 30, right: 12),
              child: Icon(Icons.flag_outlined, color: AppColors.white),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, right: 16),
              child: Icon(Icons.settings, color: AppColors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.lightGreyColor,
                  child:
                      Icon(Icons.person, size: 50, color: AppColors.darkgrey),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ALEN JOHN',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '+91 9876543211 | alenjohn@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkgrey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()),
                    );
                  },
                  child: const Text(
                    'Edit profile >',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                  'Settings',
                  'Manage Account, Security',
                  () => pushNavigation(context, const SettingsPage()),
                ),
                _buildListTile(
                  'Delivery Addresses',
                  'Edit & Add New Address',
                  () => pushNavigation(context, const AddressPage()),
                ),
                _buildListTile(
                  'Notification',
                  'Updates & Info',
                  () => pushNavigation(context, const NotificationsPage()),
                ),
                _buildListTile(
                  'Payments',
                  'Payment Mode & status',
                  () => pushNavigation(context, const PaymentsPage()),
                ),
                _buildListTile(
                  'Orders',
                  'Recent Orders',
                  () => pushNavigation(context, const PastOrdersPage()),
                ),
                const Divider(height: 1),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, VoidCallback onTap) {
    return Column(children: [
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ListTile(
          title: Text(title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black)),
          subtitle: Text(subtitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: AppColors.darkgrey)),
          onTap: onTap,
        ),
      ),
      const Divider(
        height: 1,
        thickness: 0.5,
        color: AppColors.grey,
        indent: 16,
        endIndent: 16,
      ),
    ]);
  }
}
