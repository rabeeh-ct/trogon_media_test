import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:trogon_media_test/presentation/screens/course_screen/course_screen_controller.dart';

import '../../../../domain/entities/course_details_response_entity.dart';
import '../../../theme/theme.dart';
import '../../../widgets/app_text.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key, required this.courseDetails, required this.index});
  final CourseDetailsEntity courseDetails;
  final int index;

  @override
  Widget build(BuildContext context) {
    final CourseScreenController screenController =Get.find();
    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 60,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: GestureDetector(
              onTap: () {
                screenController.selectedIndex.value = index;
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  boxShadow: index ==
                      screenController.selectedIndex.value
                      ? defaultShadow
                      : null,
                  color: index ==
                      screenController.selectedIndex.value
                      ? primaryColor
                      : secondaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: AppText(
                    courseDetails.title,
                    size: 17,
                    align: TextAlign.center,
                    weight: FontWeight.bold,
                    color: index ==
                        screenController.selectedIndex.value
                        ? whiteColor
                        : primaryColor,
                  ),
                ),
              ),
            ),
          ),
          if (index == screenController.selectedIndex.value)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
            )
        ],
      );
    });
  }
}
