class SessionResponseEntity {
  final String status;
  final String message;
  final SessionEntity data;

  SessionResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class SessionEntity {
  final List<VideoListEntity> videoList;
  final LastWatchedEntity lastWatched;

  SessionEntity({
    required this.videoList,
    required this.lastWatched,
  });
}

class LastWatchedEntity {
  final dynamic uniqueId;
  final String duration;

  LastWatchedEntity({
    required this.uniqueId,
    required this.duration,
  });
}


class VideoListEntity {
  final String id;
  final String uniqueId;
  final String videoType;
  final String videoUrl;
  final String vimeoId;
  final String title;
  final String free;
  final String duration;
  final String thumbnail;

  VideoListEntity({
    required this.id,
    required this.uniqueId,
    required this.videoType,
    required this.videoUrl,
    required this.vimeoId,
    required this.title,
    required this.free,
    required this.duration,
    required this.thumbnail,
  });
}