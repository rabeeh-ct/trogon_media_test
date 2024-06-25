import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../course_screen_controller.dart';
import '../../../theme/theme.dart';

import '../../../../domain/entities/course_details_response_entity.dart';
import '../../../routes/route_constants.dart';
import '../../../widgets/app_cached_image.dart';
import '../../../widgets/app_text.dart';
import '../../session_screen/session_screen_controller.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.sectionEntity, required this.index});

  final SectionEntity sectionEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    final CourseScreenController screenController = Get.find();
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteList.sessionScreen, arguments: sectionEntity.id)?.then(
          (value) => Get.delete<SessionScreenController>(),
        );
      },
      child: Card(
        elevation: 4,
        shadowColor: blackColor.withOpacity(0.5),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  // height: 86,
                  child: CachedImage(
                    imageUrl: sectionEntity.thumbnail,
                  ),
                ),
              ),
              10.sBW,
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      "${screenController.data[screenController.selectedIndex.value].title ?? ""} - Lesson ${index + 1}",
                      color: const Color(0xff553283),
                      size: 12,
                    ),
                    AppText(
                      sectionEntity.title,
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: sectionEntity.total>0?AspectRatio(
                  aspectRatio: 1,
                  child: CircularStepProgressIndicator(
                    totalSteps: sectionEntity.total,
                    currentStep: sectionEntity.completed,
                    // stepSize: sectionEntity.total * 1.0,
                    selectedColor: primaryColor,
                    unselectedColor: const Color(0xffF2E8F5),
                    padding: 0,
                    // width: 150,
                    // height: 150,
                    selectedStepSize: 15,
                    roundedCap: (_, __) => true,
                    child: Center(
                        child: AppText(
                      sectionEntity.videoCount,
                      size: 10,
                    )),
                  ),
                ):const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
