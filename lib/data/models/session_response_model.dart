import '../../domain/entities/session_response_entity.dart';

class SessionResponseModel extends SessionResponseEntity {
  SessionResponseModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory SessionResponseModel.fromJson(Map<String, dynamic> json) => SessionResponseModel(
    status: json["status"],
    message: json["message"],
    data: SessionModel.fromJson(json["data"]),
  );
}

class SessionModel extends SessionEntity {
  SessionModel({
    required super.videoList,
    required super.lastWatched,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
    videoList: List<VideoListModel>.from(json["video_list"].map((x) => VideoListModel.fromJson(x))),
    lastWatched: LastWatchedModel.fromJson(json["last_watched"]),
  );
}

class LastWatchedModel extends LastWatchedEntity {
  LastWatchedModel({
    required super.uniqueId,
    required super.duration,
  });

  factory LastWatchedModel.fromJson(Map<String, dynamic> json) => LastWatchedModel(
    uniqueId: json["unique_id"],
    duration: json["duration"],
  );
}

class VideoListModel extends VideoListEntity {
  VideoListModel({
    required super.id,
    required super.uniqueId,
    required super.videoType,
    required super.videoUrl,
    required super.vimeoId,
    required super.title,
    required super.free,
    required super.duration,
    required super.thumbnail,
  });

  factory VideoListModel.fromJson(Map<String, dynamic> json) => VideoListModel(
    id: json["id"],
    uniqueId: json["unique_id"],
    videoType: json["video_type"],
    videoUrl: json["video_url"],
    vimeoId: json["vimeo_id"],
    title: json["title"],
    free: json["free"],
    duration: json["duration"],
    thumbnail: json["thumbnail"],
  );

}
