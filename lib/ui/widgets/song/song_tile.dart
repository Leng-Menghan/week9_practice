import 'package:flutter/material.dart';

import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.songMap,
    required this.isPlaying,
    required this.onTap, 
  });

  final Map<String, dynamic> songMap;
  final bool isPlaying;
  final VoidCallback onTap;

  Song get song => songMap['song'];
  String get duration => "${song.duration.inMinutes}:${(song.duration.inSeconds % 60).toString().padLeft(2, '0')} mns";
  String get artistName => songMap['artistName'];
  String get genre => songMap['artistGenre'];
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(song.title),
          subtitle: Text("$duration $artistName - $genre"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(song.imageUrl),
          ),
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
