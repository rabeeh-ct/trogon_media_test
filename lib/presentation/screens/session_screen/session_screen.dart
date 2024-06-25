import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_media_test/presentation/theme/theme.dart';
import 'package:trogon_media_test/presentation/widgets/app_cached_image.dart';
import 'package:trogon_media_test/presentation/widgets/app_text.dart';
import '../../../utils/formatters.dart';
import '../../widgets/network_resource.dart';
import 'session_screen_controller.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenController = Get.put(SessionScreenController());
    return Scaffold(
      body: Obx(() {
        return NetworkResource(
          retry: screenController.getData,
          loading: screenController.pageLoading.value,
          appError: screenController.appError,
          child: SafeArea(
            child: Column(
              children: [
                screenController.flickManager.value != null
                    ? FlickVideoPlayer(flickManager: screenController.flickManager.value!)
                    : Stack(
                        children: [
                          CachedImage(imageUrl: screenController.videoEntity.value?.thumbnail),
                          Positioned.fill(
                            // alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {
                                if (screenController.videoEntity.value?.videoUrl != null) {
                                  screenController.initializeController(
                                      screenController.videoEntity.value!.videoUrl);
                                }
                              },
                              icon: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: greyColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                Container(
                  width: double.maxFinite,
                  color: whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // FlickVideoPlayer(flickManager: screenController.flickManager.value!),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              screenController.videoEntity.value?.title,
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                            AppText(
                              screenController.videoEntity.value?.duration,
                              size: 16,
                              // weight: FontWeight.w600,
                              color: const Color(0xffADADAD),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(defaultPadding),
                    itemBuilder: (context, index) => Card(
                      elevation: 4,
                      margin: EdgeInsets.zero,
                      // tileColor: secondaryColor,
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Text("${index + 1}"),
                      ),
                    ),
                    separatorBuilder: (context, index) => 10.sBH,
                    itemCount: 8,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
