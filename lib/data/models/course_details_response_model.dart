import '../../domain/entities/course_details_response_entity.dart';

class CourseDetailsResponseModel extends CourseDetailsResponseEntity {
  CourseDetailsResponseModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory CourseDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<CourseDetailsModel>.from(
            json["data"].map((x) => CourseDetailsModel.fromJson(x))),
      );
}

class CourseDetailsModel extends CourseDetailsEntity {
  CourseDetailsModel({
    required super.id,
    required super.title,
    required super.lock,
    required super.sections,
    required super.completion,
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) => CourseDetailsModel(
        id: json["id"],
        title: json["title"],
        lock: json["is_locked"],
        sections: json["sections"]==null?[]:List<SectionModel>.from(json["sections"].map((x) => SectionModel.fromJson(x))),
        completion: json["completion"],
      );
}

class SectionModel extends SectionEntity {
  SectionModel({
    required super.id,
    required super.title,
    required super.courseId,
    required super.levelId,
    required super.order,
    required super.thumbnail,
    required super.background,
    required super.icon,
    required super.free,
    required super.instructorId,
    required super.isAttended,
    required super.isCompleted,
    required super.total,
    required super.videoCount,
    required super.completed,
  });

factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
  id: json["id"],
  title: json["title"],
  courseId: json["course_id"],
  levelId: json["level_id"],
  order: json["order"],
  thumbnail: json["thumbnail"],
  background: json["background"],
  icon: json["icon"],
  free: json["free"],
  instructorId: json["instructor_id"],
  isAttended: json["is_attended"]??0,
  isCompleted: json["is_completed"]??0,
  total: json["total"]??0,
  videoCount: json["video_count"],
  completed: json["completed"]??0,
);
}
