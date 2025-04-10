import 'package:flutter/material.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';
import 'package:supermarket_fe/core/utils/navigations.dart';
import 'package:supermarket_fe/widgets/common_widget/yellow_button.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

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
                onTap: () {
                  popNavigation(context);
                },
                child: Image.asset(AppAssets.arrowbackIcon)),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'Address',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: AppColors.darkgrey),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("abc Rood",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.black)),
                            SizedBox(height: 4),
                            Text(
                              "123 Main Street, Apt 4B, City, State, 688005",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColors.darkgrey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("House/Flat/Block No", "123"),
                  _buildTextField("Appartment/Road/Area", "Main Street"),
                  _buildTextField("Direction to reach", "Abc", maxLines: 3),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Save as",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.green)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildChoiceChip(Icons.home_outlined, "Home", true),
                      const SizedBox(width: 8),
                      _buildChoiceChip(Icons.work_outline, "Work", false),
                      const SizedBox(width: 8),
                      _buildChoiceChip(Icons.add, "Add Other", false),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Reciever Number", "+91 9632587532"),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          label: 'Save',
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            cursorColor: AppColors.green, // Set cursor color
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: AppColors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColors.green, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(IconData icon, String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.green[100] : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: selected ? Colors.green : AppColors.darkgrey),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: selected ? Colors.green : Colors.black54),
          const SizedBox(width: 6),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
