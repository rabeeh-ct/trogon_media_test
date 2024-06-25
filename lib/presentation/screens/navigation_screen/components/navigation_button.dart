import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_media_test/presentation/screens/navigation_screen/navigation_screen_controller.dart';
import 'package:trogon_media_test/presentation/theme/theme.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key, required this.icon, required this.index});

  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final NavigationScreenController screenController = Get.find();
    return Obx(() {
        return Icon(
          icon,
          size: 30,
          color: screenController.selectedIndex.value == index ? yellowColor : greyColor,
        );
      }
    );
  }
}
