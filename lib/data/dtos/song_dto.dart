    import '../../model/songs/song.dart';

class SongDto {
  static const String imageUrlKey = 'imageUrl';
  static const String titleKey = 'title';
  static const String artistIdKey = 'artistId';
  static const String durationKey = 'duration';   // in ms

  static Song fromJson(String id, Map<String, dynamic> json) {
    assert(json[imageUrlKey] is String);
    assert(json[titleKey] is String);
    assert(json[artistIdKey] is String);
    assert(json[durationKey] is int);

    return Song(
      id: id,
      imageUrl: json[imageUrlKey], 
      title: json[titleKey], 
      artistId: json[artistIdKey], 
      duration: Duration(milliseconds: json[durationKey])
    );
  }

  /// Convert Song to JSON
  Map<String, dynamic> toJson(Song song) {
    return {
      imageUrlKey: song.imageUrl,
      titleKey: song.title,
      artistIdKey: song.artistId,
      durationKey: song.duration.inMilliseconds,
    };
  }
}
