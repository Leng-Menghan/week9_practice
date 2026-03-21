import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  static final Uri baseUrl = Uri.https('week-8-practice-1c0fa-default-rtdb.asia-southeast1.firebasedatabase.app');
  static final Uri songsUrl = baseUrl.replace(path: 'songs.json');

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUrl);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);
      List<Song> songs = [];
      for(var songEntry in songJson.entries){
        String id = songEntry.key;
        Map<String, dynamic> value = songEntry.value;
        Song song = SongDto.fromJson(id, value);
        songs.add(song);
      }
      return songs;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {}
}
