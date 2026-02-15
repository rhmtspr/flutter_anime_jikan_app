import '../../domain/entities/anime.dart';

class AnimeModel extends Anime {
  const AnimeModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.score,
    required super.synopsis,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['mal_id'] ?? 0,
      title: json['title'] ?? '',
      imageUrl: json['images']?['jpg']?['image_url'] ?? '',
      score: (json['score'] ?? 0).toDouble(),
      synopsis: json['synopsis'] ?? '',
    );
  }
}
