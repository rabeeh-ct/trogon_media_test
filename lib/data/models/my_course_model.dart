import '../../domain/entities/my_course_entity.dart';

class MyCourseResponseModel extends MyCourseResponseEntity {
  MyCourseResponseModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory MyCourseResponseModel.fromJson(Map<String, dynamic> json) => MyCourseResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : MyCourseModel.fromJson(json["data"]),
      );
}

class MyCourseModel extends MyCourseEntity {
  MyCourseModel({
    required super.userdata,
    required super.subjects,
    required super.pyqExams,
    required super.upcomingExams,
    required super.syllabus,
    required super.practiceLink,
  });

  factory MyCourseModel.fromJson(Map<String, dynamic> json) => MyCourseModel(
        userdata: UserdataModel.fromJson(json["userdata"]),
        subjects:
            List<SubjectModel>.from(json["subjects"].map((x) => SubjectModel.fromJson(x))),
        pyqExams: List<dynamic>.from(json["pyq_exams"].map((x) => x)),
        upcomingExams: List<dynamic>.from(json["upcoming_exams"].map((x) => x)),
        syllabus: json["syllabus"],
        practiceLink: json["practice_link"],
      );
}

class SubjectModel extends SubjectEntity {
  SubjectModel({
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
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
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
      );
}

class UserdataModel extends UserdataEntity {
  UserdataModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.countryCode,
    required super.phoneSecondary,
    required super.userEmail,
    required super.email,
    required super.gender,
    required super.place,
    required super.roleId,
    required super.roleLabel,
    required super.deviceId,
    required super.status,
    required super.courseId,
    required super.courseName,
    required super.courseType,
    required super.image,
    required super.androidVersion,
    required super.deviceIdMessage,
    required super.noCourseText,
    required super.noCourseImage,
    required super.contactEmail,
    required super.contactPhone,
    required super.contactWhatsapp,
    required super.contactAddress,
    required super.contactAbout,
    required super.zoomId,
    required super.zoomPassword,
    required super.zoomApiKey,
    required super.zoomSecretKey,
    required super.zoomWebDomain,
    required super.token,
    required super.privacyPolicy,
    required super.privacyPolicyText,
    required super.coins,
  });

  factory UserdataModel.fromJson(Map<String, dynamic> json) => UserdataModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        countryCode: json["country_code"],
        phoneSecondary: json["phone_secondary"],
        userEmail: json["user_email"],
        email: json["email"],
        gender: json["gender"],
        place: json["place"],
        roleId: json["role_id"],
        roleLabel: json["role_label"],
        deviceId: json["device_id"],
        status: json["status"],
        courseId: json["course_id"],
        courseName: json["course_name"],
        courseType: json["course_type"],
        image: json["image"],
        androidVersion: json["android_version"],
        deviceIdMessage: json["device_id_message"],
        noCourseText: json["no_course_text"],
        noCourseImage: json["no_course_image"],
        contactEmail: json["contact_email"],
        contactPhone: json["contact_phone"],
        contactWhatsapp: json["contact_whatsapp"],
        contactAddress: json["contact_address"],
        contactAbout: json["contact_about"],
        zoomId: json["zoom_id"],
        zoomPassword: json["zoom_password"],
        zoomApiKey: json["zoom_api_key"],
        zoomSecretKey: json["zoom_secret_key"],
        zoomWebDomain: json["zoom_web_domain"],
        token: json["token"],
        privacyPolicy: json["privacy_policy"],
        privacyPolicyText: json["privacy_policy_text"],
        coins: json["coins"],
      );
}
