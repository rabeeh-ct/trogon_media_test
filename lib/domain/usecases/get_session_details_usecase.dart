import 'package:dartz/dartz.dart';
import '../entities/session_response_entity.dart';
import '../params/no_params.dart';
import '../repository/data_repository.dart';
import '/domain/usecases/usecase.dart';
import 'package:get/get.dart';

import '../entities/app_error.dart';

class GetSessionDetailsUseCase extends UseCase<SessionResponseEntity, NoParams> {
  final DataRepository _dataRepository = Get.find();

  @override
  Future<Either<AppError, SessionResponseEntity>> call(NoParams params,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dataRepository.getSessionDetails(queryParameters);
  }
}

class SessionDetailsQueryParams {
  final String authToken;
  final String lessonId;

  SessionDetailsQueryParams({
    required this.authToken,
    required this.lessonId,
  });

  Map<String, dynamic> toMap() => {
        "auth_token": authToken,
        "lesson_id": lessonId,
      };
}
