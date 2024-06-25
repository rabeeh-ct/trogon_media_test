import 'package:dartz/dartz.dart';
import '../entities/course_details_response_entity.dart';
import '../params/no_params.dart';
import '../repository/data_repository.dart';
import '/domain/usecases/usecase.dart';
import 'package:get/get.dart';

import '../entities/app_error.dart';

class GetCourseDetailsUseCase extends UseCase<CourseDetailsResponseEntity, NoParams> {
  final DataRepository _dataRepository = Get.find();

  @override
  Future<Either<AppError, CourseDetailsResponseEntity>> call(NoParams params,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dataRepository.getCourseDetails(queryParameters);
  }
}

class CourseDetailsQueryParams {
  final String authToken;
  final String courseId;
  final String section;

  CourseDetailsQueryParams({
    required this.authToken,
    required this.courseId,
    required this.section,
  });

  Map<String, dynamic> toMap() => {
        "auth_token": authToken,
        "section_id": section,
        "course_id": courseId,
      };
}
