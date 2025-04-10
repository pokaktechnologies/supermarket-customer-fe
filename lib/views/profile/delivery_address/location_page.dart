import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:supermarket_fe/core/theme/app_assets.dart';
import 'package:supermarket_fe/core/theme/app_colors.dart';
import 'package:supermarket_fe/core/utils/navigations.dart';
import 'package:supermarket_fe/views/profile/delivery_address/add_address_page.dart';
import 'package:supermarket_fe/widgets/common_widget/yellow_button.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng _currentPosition = const LatLng(9.9312, 76.2673); // Default: Kochi

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) return;

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backgroundcolor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: AppColors.green,
      //   elevation: 0,
      //   title: Row(
      //     children: [
      //       GestureDetector(
      //         onTap: () => Navigator.pop(context),
      //         child: const Icon(Icons.arrow_back, color: Colors.white),
      //       ),
      //       const SizedBox(width: 8),
      //       const Text("Select delivery location",
      //           style: TextStyle(color: Colors.white)),
      //       const Spacer(),
      //       const Icon(Icons.search, color: Colors.white),
      //     ],
      //   ),
      // ),
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
                  'Select delivery location',
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
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: {
                Marker(
                  markerId: const MarkerId("current_location"),
                  position: _currentPosition,
                ),
              },
              onCameraMove: (CameraPosition position) {
                setState(() {
                  _currentPosition = position.target;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.my_location, color: AppColors.green),
                    SizedBox(width: 8),
                    Text('Use Current Location',
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.green,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                const Divider(
                  color: AppColors.grey,
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: AppColors.darkgrey,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("abc Road",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            "123 Main Street, Apt 4B, City, State, 688005",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: 'Confirm Location',
                  onPressed: () {
                     pushNavigation(context, const AddAddressPage());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
