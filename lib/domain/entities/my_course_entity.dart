class MyCourseResponseEntity {
  final int status;
  final String message;
  final MyCourseEntity? data;

  MyCourseResponseEntity({
    required this.status,
    required this.message,
    this.data,
  });
}

class MyCourseEntity {
  final UserdataEntity userdata;
  final List<SubjectEntity> subjects;
  final List<dynamic> pyqExams;
  final List<dynamic> upcomingExams;
  final String syllabus;
  final String practiceLink;

  MyCourseEntity({
    required this.userdata,
    required this.subjects,
    required this.pyqExams,
    required this.upcomingExams,
    required this.syllabus,
    required this.practiceLink,
  });
}

class SubjectEntity {
  final String id;
  final String title;
  final String courseId;
  final String? levelId;
  final String order;
  final String thumbnail;
  final String background;
  final String icon;
  final String free;
  final dynamic instructorId;

  SubjectEntity({
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
  });
}

class UserdataEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String countryCode;
  final dynamic phoneSecondary;
  final String userEmail;
  final String email;
  final String gender;
  final String place;
  final String roleId;
  final String roleLabel;
  final String deviceId;
  final String status;
  final String courseId;
  final String courseName;
  final String courseType;
  final String image;
  final dynamic androidVersion;
  final String deviceIdMessage;
  final String noCourseText;
  final String noCourseImage;
  final String contactEmail;
  final String contactPhone;
  final String contactWhatsapp;
  final String contactAddress;
  final String contactAbout;
  final String zoomId;
  final String zoomPassword;
  final String zoomApiKey;
  final String zoomSecretKey;
  final String zoomWebDomain;
  final String token;
  final String privacyPolicy;
  final String privacyPolicyText;
  final int coins;

  UserdataEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.countryCode,
    required this.phoneSecondary,
    required this.userEmail,
    required this.email,
    required this.gender,
    required this.place,
    required this.roleId,
    required this.roleLabel,
    required this.deviceId,
    required this.status,
    required this.courseId,
    required this.courseName,
    required this.courseType,
    required this.image,
    required this.androidVersion,
    required this.deviceIdMessage,
    required this.noCourseText,
    required this.noCourseImage,
    required this.contactEmail,
    required this.contactPhone,
    required this.contactWhatsapp,
    required this.contactAddress,
    required this.contactAbout,
    required this.zoomId,
    required this.zoomPassword,
    required this.zoomApiKey,
    required this.zoomSecretKey,
    required this.zoomWebDomain,
    required this.token,
    required this.privacyPolicy,
    required this.privacyPolicyText,
    required this.coins,
  });
}
