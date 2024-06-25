import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/my_course_entity.dart';
import '../../theme/theme.dart';
import '../../widgets/app_text.dart';
import '../../widgets/network_resource.dart';
import 'components/course_card.dart';
import 'components/square_button.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController screenController = Get.find();
    return Obx(() {
      return NetworkResource(
        retry: screenController.getData,
        loading: screenController.pageLoading.value,
        appError: screenController.appError,
        child: screenController.myCourse.value != null
            ? Scaffold(
                appBar: AppBar(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        "Hi Good Morning !",
                        color: whiteColor,
                        size: 14,
                      ),
                      AppText(
                        screenController.myCourse.value!.userdata.firstName,
                        color: whiteColor,
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  backgroundColor: primaryColor,
                  actions: [
                    Container(
                      width: 50,
                      height: 23,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            screenController.myCourse.value!.userdata.coins,
                            color: yellowColor,
                            weight: FontWeight.w700,
                            size: 12,
                          ),
                          Image.asset("assets/images/dollar_icon.png")
                          // AppSvg(assetName: "dollar_icon"),
                        ],
                      ),
                    ),
                    10.sBW,
                    CircleAvatar(
                      backgroundColor: whiteColor,
                      foregroundImage: CachedNetworkImageProvider(
                        screenController.myCourse.value!.userdata.image,
                      ),
                    ),
                    20.sBW,
                  ],
                ),
                body: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      // height: 120,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                        gradient: LinearGradient(
                            colors: [primaryColor, primaryColorLight],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      child: Container(
                        width: double.maxFinite,
                        height: 60,
                        margin: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding * 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: lightGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AppText(
                                  "Selected Course",
                                  size: 12,
                                  weight: FontWeight.w300,
                                  color: Color(0xff707070),
                                ),
                                AppText(
                                  screenController.myCourse.value!.userdata.courseName,
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ],
                            ),
                            Container(
                              width: 100,
                              height: 34,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8), color: primaryColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const AppText(
                                    "Change",
                                    color: whiteColor,
                                    weight: FontWeight.w500,
                                  ),
                                  10.sBW,
                                  const Icon(
                                    Icons.sync_alt,
                                    color: whiteColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SquareButton(
                                  imagePath: "exam_icon",
                                  text: "Exam",
                                  onPress: () {},
                                  firstColor: const Color(0xffED617B),
                                  secondColor: const Color(0xffF2859B),
                                ),
                                SquareButton(
                                  imagePath: "practice_icon",
                                  text: "Practice",
                                  onPress: () {},
                                  firstColor: const Color(0xffFFAF01),
                                  secondColor: const Color(0xffECC07F),
                                ),
                                SquareButton(
                                  imagePath: "materials_icon",
                                  text: "Materials",
                                  onPress: () {},
                                  firstColor: const Color(0xff24AED2),
                                  secondColor: const Color(0xff7BC9DD),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding / 2,
                              horizontal: defaultPadding,
                            ),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      "Courses",
                                      weight: FontWeight.w700,
                                      size: 16,
                                    ),
                                    AppText(
                                      "See All",
                                      weight: FontWeight.w600,
                                      size: 16,
                                      color: primaryColor,
                                    ),
                                  ],
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: .75,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 20,
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder: (context, index) {
                                    final SubjectEntity course =
                                        screenController.myCourse.value!.subjects[index];
                                    return CourseCard(course: course);
                                  },
                                  itemCount: screenController.myCourse.value!.subjects.length,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 170,
                            child: Stack(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  margin: const EdgeInsets.only(
                                    left: defaultPadding,
                                    right: defaultPadding,
                                    bottom: defaultPadding,
                                    top: 30,
                                  ),
                                  // height: 130,
                                  decoration: BoxDecoration(
                                    color: lightYellowColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppText(
                                        "Practice With Previous Year\nQuestion Papers",
                                        weight: FontWeight.w600,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(.8, -1),
                                  child: Image.asset(
                                    "assets/images/practice_boy_icon.png",
                                    height: 130,
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0, 1),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        shape: BoxShape.circle),
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xff512E7E), shape: BoxShape.circle),
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      );
    });
  }
}
