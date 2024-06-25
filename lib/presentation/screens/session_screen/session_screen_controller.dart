import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:trogon_media_test/utils/debug_utils.dart';
import 'package:video_player/video_player.dart';

import '../../../common/constants.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/session_response_entity.dart';
import '../../../domain/params/no_params.dart';
import '../../../domain/usecases/get_session_details_usecase.dart';
import '../../../utils/snackbar_utils.dart';

class SessionScreenController extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Rxn<FlickManager> flickManager = Rxn();

  AppError? appError;
  RxBool pageLoading = false.obs;
  final _getSessionDetailsUseCase = Get.put(GetSessionDetailsUseCase());
  Rxn<VideoListEntity> videoEntity = Rxn();
  Rxn<SessionEntity> sessionEntity = Rxn();

  VideoPlayerController? controller;

  Future<void> pullRefresh() async {
    return await getData(isPull: true);
  }

  getData({bool isPull = false}) async {
    if (!isPull) {
      pageLoading(true);
      //clear data
    }
    appError = null;
    SessionDetailsQueryParams queryParams = SessionDetailsQueryParams(
      authToken: token,
      lessonId: Get.arguments,
    );
    final response = await _getSessionDetailsUseCase(const NoParams(),
        queryParameters: queryParams.toMap());
    response.fold((l) {
      appError = l;
      return l.handleError();
    }, (r) async {
      if (r.status == "1") {
        sessionEntity.value = r.data;

        videoEntity.value=sessionEntity.value?.videoList.firstOrNull;
        // if(videoEntity.value!=null) {
        //   await initializeController(videoEntity.value!.videoUrl);
        // }
        //data = r.data;
      } else {
        showMessage(r.message);
      }
    });
    pageLoading(false);
  }

  initializeController(String str) async {
    flickManager.value = FlickManager(
      autoPlay: true,
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(str),
      ),
    );
  }

  @override
  void onClose() {
    flickManager.value?.flickControlManager?.pause();
    flickManager.value?.dispose();
    controller?.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    consoleLog(">>>>>>>>>>>>>>>>>>>");
    consoleLog("session dispose called");
    flickManager.value?.flickControlManager?.pause();
    flickManager.value?.dispose();
    controller?.dispose();
    super.dispose();
  }
}
