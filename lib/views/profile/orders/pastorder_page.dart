import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';
import 'package:supermarket_fe/core/utils/navigations.dart';
import 'package:supermarket_fe/views/profile/orders/orderdelivered_page.dart';

class PastOrdersPage extends StatefulWidget {
  const PastOrdersPage({super.key});

  @override
  State<PastOrdersPage> createState() => _PastOrdersPageState();
}

class _PastOrdersPageState extends State<PastOrdersPage> {
  final orders = [
    {
      'address': 'Abc Road, Order #12345',
      'amount': '₹ 250',
      'items': 'Hybrid Tomato, Broccoli, Dark chocolate',
      'status': 'Delivered',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'address': 'Abc Road, Order #12345',
      'amount': '₹ 250',
      'items': 'Hybrid Tomato, Broccoli, Dark chocolate',
      'status': 'Cancelled',
      'icon': Icons.cancel,
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () => popNavigation(context),
              child: Image.asset(AppAssets.arrowbackIcon),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'Past Orders',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: orders.length,
                itemBuilder: (_, i) {
                  var order = orders[i];
                  return InkWell(
                    onTap: () {
                      if (order['status'] == 'Delivered') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const OrderDetailPage(),
                          ),
                        );
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    order['address'].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      order['status'].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: order['color'] as Color,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      order['icon'] as IconData,
                                      color: order['color'] as Color,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              order['amount'].toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkgrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              order['items'].toString(),
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.darkgrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
