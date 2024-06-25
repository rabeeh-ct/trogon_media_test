import 'package:get/get.dart';
import 'package:trogon_media_test/utils/debug_utils.dart';

import '../../../common/constants.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/course_details_response_entity.dart';
import '../../../domain/params/no_params.dart';
import '../../../domain/usecases/get_course_details_usecase.dart';
import '../../../utils/snackbar_utils.dart';
import '../../../utils/user_preference_utils.dart';

class CourseScreenController extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  final GetCourseDetailsUseCase _getCourseDetailsUseCase = Get.put(GetCourseDetailsUseCase());

  AppError? appError;
  RxBool pageLoading = false.obs;
  RxList<CourseDetailsEntity> data = <CourseDetailsEntity>[].obs;
  RxInt selectedIndex=0.obs;

  Future<void> pullRefresh() async {
    return await getData(isPull: true);
  }

  getData({bool isPull = false}) async {
    if (!isPull) {
      pageLoading(true);
      //clear data
    }
    appError = null;
    consoleLog(Get.arguments);
    final response = await _getCourseDetailsUseCase(const NoParams(),
        queryParameters: CourseDetailsQueryParams(
          authToken: token,
          courseId: Get.arguments,
          section: "",
        ).toMap());
    response.fold((l) {
      appError = l;
      return l.handleError();
    }, (r) async {
      if (r.status == 1) {
        data.value = r.data;
        //data = r.data;
      } else {
        showMessage(r.message);
      }
    });
    pageLoading(false);
  }
}
