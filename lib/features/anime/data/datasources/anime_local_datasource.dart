import 'package:hive/hive.dart';
import '../models/favorite_anime_model.dart';

abstract class AnimeLocalDataSource {
  List<FavoriteAnimeModel> getFavorites();
  Future<void> toggleFavorite(FavoriteAnimeModel anime);
  bool isFavorite(int id);
}

class AnimeLocalDataSourceImpl implements AnimeLocalDataSource {
  final Box<FavoriteAnimeModel> box;

  AnimeLocalDataSourceImpl(this.box);

  @override
  List<FavoriteAnimeModel> getFavorites() {
    return box.values.toList();
  }

  @override
  Future<void> toggleFavorite(FavoriteAnimeModel anime) async {
    final existingKey = box.keys.firstWhere(
      (key) => box.get(key)!.id == anime.id,
      orElse: () => null,
    );

    if (existingKey != null) {
      await box.delete(existingKey);
    } else {
      await box.add(anime);
    }
  }

  @override
  bool isFavorite(int id) {
    return box.values.any((anime) => anime.id == id);
  }
}
