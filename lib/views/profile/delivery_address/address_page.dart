import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';
import 'package:supermarket_fe/core/utils/navigations.dart';
import 'package:supermarket_fe/views/profile/delivery_address/addresscard_page.dart';
import 'package:supermarket_fe/views/profile/delivery_address/location_page.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final addresses = [
    {
      'label': 'HOME',
      'text': '123 Main Street, Apt 4B, City, State, 688005\n+91 8602214875'
    },
    {
      'label': 'WORK',
      'text': '456 Corporate Ave, Tower 3, City, State, 688005\n+91 9602215875'
    },
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.backgroundcolor,
        resizeToAvoidBottomInset: true,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Addresses',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                  Icon(
                    Icons.search,
                    color: AppColors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: addresses.length,
                itemBuilder: (_, i) => AddressCard(
                  label: addresses[i]['label']!,
                  address: addresses[i]['text']!,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.orange,
          shape: const CircleBorder(),
          onPressed: () {
               pushNavigation(context, const LocationPage());
          },
          child: const Icon(Icons.add, color: AppColors.white),
        ),
      );
}
