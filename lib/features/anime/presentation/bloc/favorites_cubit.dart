import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/anime.dart';
import '../../domain/usecases/get_favorites.dart';
import '../../domain/usecases/toggle_favorite.dart';

class FavoritesCubit extends Cubit<Set<int>> {
  FavoritesCubit() : super({});

  void loadFavorites() {
    final favorites = Hive.box('favorites').values.cast<int>().toSet();
    emit(favorites);
  }

  void toggleFavorite(int id) {
    final box = Hive.box('favorites');
    final newState = Set<int>.from(state);

    if (newState.contains(id)) {
      box.delete(id);
      newState.remove(id);
    } else {
      box.put(id, id);
      newState.add(id);
    }

    emit(newState);
  }

  bool isFavorite(int id) => state.contains(id);
}
