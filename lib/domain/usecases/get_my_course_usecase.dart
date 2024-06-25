import 'package:dartz/dartz.dart';
import '../entities/my_course_entity.dart';
import '../params/no_params.dart';
import '../repository/data_repository.dart';
import '/domain/usecases/usecase.dart';
import 'package:get/get.dart';

import '../entities/app_error.dart';

class GetMyCourseUseCase extends UseCase<MyCourseResponseEntity, NoParams> {
  final DataRepository _dataRepository=Get.find();

  @override
  Future<Either<AppError, MyCourseResponseEntity>> call(NoParams params, {Map<String, dynamic>? queryParameters}) async {
    return await _dataRepository.getMyCourse(queryParameters);
  }
}
