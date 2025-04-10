import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';
import 'package:supermarket_fe/core/utils/navigations.dart';
import 'package:supermarket_fe/views/profile/settings/settings_tile_page.dart';
import 'package:supermarket_fe/views/profile/settings/themedialog_box.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
          title: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'Settings',
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
        padding: const EdgeInsets.all(16),
        children: [
          SettingsTile(
            title: 'Notification Settings',
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                title: const Text(
                  'Email Notifications',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                value: false,
                onChanged: (val) {},
                activeColor: AppColors.green,
                tileColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                title: const Text(
                  'Push Notifications',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                value: true,
                onChanged: (val) {},
                activeColor: AppColors.green,
                tileColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
              ),
            ],
          ),
          const SettingsTile(
            title: 'Data Privacy',
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                title: Text(
                  'Clear Search History',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                title: Text(
                  'Reset Personalized Recommendations',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
          SettingsTile(
            title: 'Display Preferences',
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity:
                    const VisualDensity(horizontal: -2, vertical: -2),
                title: const Text(
                  'Theme',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  showThemeDialog(context);
                },
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                title: Text(
                  'Language',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                title: Text(
                  'Font Size',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
          const SettingsTile(
            title: 'Help & Support',
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                title: Text(
                  'Help Center',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity(horizontal: -2, vertical: -2),
                title: Text(
                  'Terms & Policies',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.black),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
