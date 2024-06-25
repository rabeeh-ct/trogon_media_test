import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_media_test/presentation/screens/home_screen/home_screen.dart';
import 'package:trogon_media_test/presentation/theme/theme.dart';
import 'components/navigation_button.dart';
import 'navigation_screen_controller.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationScreenController screenController = Get.find();
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: defaultShadow),
        child: CurvedNavigationBar(
            buttonBackgroundColor: primaryColor,
            index: screenController.selectedIndex.value,
            backgroundColor: greyColor.withOpacity(0.01),
            items: const [
              NavigationButton(icon: Icons.home_filled, index: 0),
              NavigationButton(icon: Icons.menu_book, index: 1),
              NavigationButton(icon: Icons.emoji_events, index: 2),
              NavigationButton(icon: Icons.analytics, index: 3),
              NavigationButton(icon: Icons.person, index: 4),
            ],
            onTap: (index) {
              screenController.selectedIndex.value = index;
            },
          )
      ),
    );
  }
}
