import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';
import 'package:supermarket_fe/core/utils/navigations.dart';
import 'package:supermarket_fe/views/profile/payments/addupi_page.dart';
import 'package:supermarket_fe/views/profile/payments/paymentcard_page.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F3),
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
              'Payments',
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
          PaymentCard(
            icon: Icons.qr_code,
            title: 'UPI',
            items: const ['abccvbnmfg@upi', 'abccvbnmfg@upi'],
            onCardTap: () {
              pushNavigation(context, const AddUpiPage());
            },
          ),
          const SizedBox(height: 12),
          PaymentCard(
            icon: Icons.credit_card,
            title: 'CARD',
            items: const ['Bank name\n5245******'],
            onCardTap: () {
              pushNavigation(context, const AddUpiPage());
            },
          ),
        ],
      ),
    );
  }
}
