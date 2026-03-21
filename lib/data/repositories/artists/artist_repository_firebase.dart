import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week9_practice/model/artists/artist.dart';

import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase implements ArtistRepository{
  static final Uri baseUrl = Uri.https('week-8-practice-1c0fa-default-rtdb.asia-southeast1.firebasedatabase.app');
  static final Uri artistsUrl = baseUrl.replace(path: 'artists.json');
  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUrl);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of artists
      Map<String, dynamic> artistJson = json.decode(response.body);
      List<Artist> artists = [];
      for(var artistEntry in artistJson.entries){
        String id = artistEntry.key;
        Map<String, dynamic> value = artistEntry.value;
        Artist artist = ArtistDto.fromJson(id, value);
        artists.add(artist);
      }
      return artists;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load artist');
    }
  }
}