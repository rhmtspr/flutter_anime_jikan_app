import 'package:hive/hive.dart';

part 'favorite_anime_model.g.dart';

@HiveType(typeId: 1)
class FavoriteAnimeModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final double score;

  FavoriteAnimeModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.score,
  });
}
