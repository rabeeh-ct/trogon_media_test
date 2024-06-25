import 'package:get/get.dart';

import '../core/api_client.dart';
import '../core/api_constants.dart';
import '../models/course_details_response_model.dart';
import '../models/my_course_model.dart';
import '../models/session_response_model.dart';

abstract class RemoteDataSource {
  Future<MyCourseResponseModel> getMyCourse({Map<String, dynamic>? queryParameters});

  Future<CourseDetailsResponseModel> getCourseDetails({Map<String, dynamic>? queryParameters});

  Future<SessionResponseModel> getSessionDetails({Map<String, dynamic>? queryParameters});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient _apiClient = Get.find();

  @override
  Future<MyCourseResponseModel> getMyCourse({Map<String, dynamic>? queryParameters}) async {
    final response =
        await _apiClient.get(ApiConstants.myCourses, queryParameters: queryParameters);
    return MyCourseResponseModel.fromJson(response);
  }

  @override
  Future<CourseDetailsResponseModel> getCourseDetails(
      {Map<String, dynamic>? queryParameters}) async {
    final response =
        await _apiClient.get(ApiConstants.getCourseDetails, queryParameters: queryParameters);
    return CourseDetailsResponseModel.fromJson(response);
  }

  @override
  Future<SessionResponseModel> getSessionDetails({Map<String, dynamic>? queryParameters}) async {
    final response =
    await _apiClient.get(ApiConstants.getSessionDetails, queryParameters: queryParameters);
    return SessionResponseModel.fromJson(response);
  }
}
