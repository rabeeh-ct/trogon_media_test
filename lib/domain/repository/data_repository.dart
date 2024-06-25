import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/course_details_response_entity.dart';
import '../entities/my_course_entity.dart';
import '../entities/session_response_entity.dart';

abstract class DataRepository {

  Future<Either<AppError, MyCourseResponseEntity>> getMyCourse(Map<String, dynamic>? queryParameters);

  Future<Either<AppError, CourseDetailsResponseEntity>> getCourseDetails(Map<String, dynamic>? queryParameters);

  Future<Either<AppError, SessionResponseEntity>> getSessionDetails(Map<String, dynamic>? queryParameters);


}
