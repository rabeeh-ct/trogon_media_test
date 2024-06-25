class CourseDetailsResponseEntity {
  final int status;
  final String message;
  final List<CourseDetailsEntity> data;

  CourseDetailsResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class CourseDetailsEntity {
  final String id;
  final String? title;
  final String? lock;
  final List<SectionEntity> sections;
  final String? completion;

  CourseDetailsEntity({
    required this.id,
    required this.title,
    required this.lock,
    required this.sections,
    required this.completion,
  });
}

class SectionEntity {
  final String id;
  final String title;
  final String courseId;
  final String levelId;
  final String order;
  final String thumbnail;
  final String background;
  final String icon;
  final String free;
  final dynamic instructorId;
  final int isAttended;
  final int isCompleted;
  final int total;
  final String? videoCount;
  final int completed;

  SectionEntity({
    required this.id,
    required this.title,
    required this.courseId,
    required this.levelId,
    required this.order,
    required this.thumbnail,
    required this.background,
    required this.icon,
    required this.free,
    required this.instructorId,
    required this.isAttended,
    required this.isCompleted,
    required this.total,
    required this.videoCount,
    required this.completed,
  });
}