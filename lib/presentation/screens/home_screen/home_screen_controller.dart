import 'package:get/get.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/my_course_entity.dart';
import '../../../domain/params/no_params.dart';
import '../../../domain/usecases/get_my_course_usecase.dart';
import '../../../utils/snackbar_utils.dart';
import '../../../utils/user_preference_utils.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  final GetMyCourseUseCase _getMyCourseUseCase = Get.put(GetMyCourseUseCase());
  Rxn<MyCourseEntity> myCourse = Rxn();

  AppError? appError;
  RxBool pageLoading = false.obs;

  Future<void> pullRefresh() async {
    return await getData(isPull: true);
  }

  getData({bool isPull = false}) async {
    if (!isPull) {
      pageLoading(true);
      //clear data
    }
    appError = null;
    final response = await _getMyCourseUseCase(const NoParams(), queryParameters: authToken);
    response.fold((l) {
      appError = l;
      return l.handleError();
    }, (r) async {
      if (r.status == 1) {
        myCourse.value = r.data;
      } else {
        showMessage(r.message);
      }
    });
    pageLoading(false);
  }
}
