class Song {
  final String id;
  final String imageUrl;
  final String title;
  final String artistId;
  final Duration duration;

  Song({
    required this.imageUrl,
    required this.title,
    required this.artistId,
    required this.duration, 
    required this.id,
  });

  @override
  String toString() {
    return 'Song(id: $id, image: $imageUrl, title: $title, artist: $artistId, duration: $duration)';
  }
}
