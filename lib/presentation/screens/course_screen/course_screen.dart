import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/level_card.dart';
import '../../widgets/network_resource.dart';
import '../../../domain/entities/course_details_response_entity.dart';
import '../../theme/theme.dart';
import '../../widgets/app_text.dart';
import 'components/section_card.dart';
import 'course_screen_controller.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenController = Get.put(CourseScreenController());
    return Scaffold(
      appBar: AppBar(
        leading: const CupertinoNavigationBarBackButton(
          color: whiteColor,
        ),
        foregroundColor: whiteColor,
        title: const AppText(
          "Course Name",
          color: whiteColor,
          weight: FontWeight.w600,
          size: 17,
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Obx(() {
        return NetworkResource(
          appError: screenController.appError,
          loading: screenController.pageLoading.value,
          retry: screenController.getData,
          child: screenController.data.isEmpty
              ? const SizedBox.shrink()
              : Column(
                  children: [
                    SizedBox(
                      height: 170,
                      child: Stack(
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                              gradient: LinearGradient(
                                  colors: [primaryColor, primaryColorLight],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: SizedBox(
                              height: 90,
                              width: double.maxFinite,
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  CourseDetailsEntity courseDetails =
                                      screenController.data[index];
                                  return LevelCard(courseDetails: courseDetails, index: index);
                                },
                                separatorBuilder: (context, index) => 10.sBW,
                                itemCount: screenController.data.length,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Card(
                            color: const Color(0xffedf7ee),
                            margin: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  5.sBH,
                                  const AppText("WhatsApp ലെ സഹായത്തിനായി",weight: FontWeight.w600,size: 14,),
                                  5.sBH,
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText("8606017527",weight: FontWeight.w600,size: 18,),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: WidgetStatePropertyAll(Color(0xff4CAF50))
                                        ),
                                        onPressed: null,
                                        child:
                                        AppText("WhatsApp",color: whiteColor,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, index) {
                              SectionEntity sectionEntity = screenController
                                  .data[screenController.selectedIndex.value].sections[index];
                              return SectionCard(
                                index: index,
                                sectionEntity: sectionEntity,
                              );
                            },
                            separatorBuilder: (context, index) => 10.sBH,
                            itemCount: screenController
                                .data[screenController.selectedIndex.value].sections.length,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
