import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_button.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class DeviceManagementTab extends StatefulWidget {
  const DeviceManagementTab({super.key});

  @override
  _DeviceManagementTabState createState() => _DeviceManagementTabState();
}

class _DeviceManagementTabState extends State<DeviceManagementTab> {
  bool _isDeviceConnected = false; // This flag controls the UI

  // Function to simulate device connection
  void _connectDevice() {
    setState(() {
      _isDeviceConnected = true; // Simulate device connection
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:
              _isDeviceConnected ? _buildConnectedUI() : _buildLinkDeviceUI(),
        ),
      ),
    );
  }

  // UI when the device is NOT connected (show Link button)
  Widget _buildLinkDeviceUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/devicetabimage.png',
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 30),
        CustomButton(
          color: AppColors.primaryColor,
          width: 320,
          onPressed: _connectDevice, // Simulate device linking
          widget: CustomText(
            text: 'Link the Device',
            fontSize: 18,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }

  // UI when the device is connected (show "SOS Device Connected" screen)
  Widget _buildConnectedUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        CustomText(
          text: 'SOS BAND',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
        const SizedBox(height: 10),
        Image.asset(
          'assets/images/devicetabimage.png',
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 30),
        CustomText(
          text: 'SOS Device Connected',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
