import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/entities/course_details_response_entity.dart';
import '../../domain/entities/my_course_entity.dart';
import '../../domain/entities/session_response_entity.dart';
import '../../domain/repository/data_repository.dart';
import '../data_sources/remote_data_source.dart';

class DataRepositoryImpl implements DataRepository {
  RemoteDataSource remoteDataSource = Get.find();

  @override
  Future<Either<AppError, MyCourseResponseEntity>> getMyCourse(Map<String, dynamic>? queryParameters) async {
    try {
      final response = await remoteDataSource.getMyCourse(queryParameters: queryParameters);
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, CourseDetailsResponseEntity>> getCourseDetails(Map<String, dynamic>? queryParameters) async {
    try {
      final response = await remoteDataSource.getCourseDetails(queryParameters: queryParameters);
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, SessionResponseEntity>> getSessionDetails(Map<String, dynamic>? queryParameters) async {
    try {
      final response = await remoteDataSource.getSessionDetails(queryParameters: queryParameters);
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

}
