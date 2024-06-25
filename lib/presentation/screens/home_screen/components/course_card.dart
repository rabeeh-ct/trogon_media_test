import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/my_course_entity.dart';
import '../../../routes/route_constants.dart';
import '../../../theme/theme.dart';
import '../../../widgets/app_cached_image.dart';
import '../../../widgets/app_text.dart';
import '../../course_screen/course_screen_controller.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course});

  final SubjectEntity course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteList.courseScreen, arguments: course.id)?.then(
          (value) => Get.delete<CourseScreenController>(),
        );
      },
      child: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(90),
                  dashPattern: const [20, 20],
                  // dashPattern: [15, 20],

                  color: const Color(0xff14C8C5).withOpacity(.3),
                  padding: const EdgeInsets.all(5),
                  strokeWidth: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGrey,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: SizedBox(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: CachedImage(
                            imageUrl: course.thumbnail,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            5.sBH,
            AppText(
              course.title,
              align: TextAlign.center,
              size: 13,
              weight: FontWeight.w500,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
