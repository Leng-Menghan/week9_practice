import '../../model/artists/artist.dart';

class ArtistDto {
  static const String imageUrlKey = 'imageUrl';
  static const String genreKey = 'genre';
  static const String nameKey = 'name';

  static Artist fromJson(String id, Map<String, dynamic> json) {
    assert(json[imageUrlKey] is String);
    assert(json[genreKey] is String);
    assert(json[nameKey] is String);

    return Artist(
      id: id, 
      genre: json[genreKey], 
      imageUrl: json[imageUrlKey], 
      name: json[nameKey]
    );
  }

  /// Convert Artist to JSON
  Map<String, dynamic> toJson(Artist artist) {
    return {
      genreKey: artist.genre,
      imageUrlKey: artist.imageUrl,
      nameKey: artist.name
    };
  }
}
