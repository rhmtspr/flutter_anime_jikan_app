import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/anime.dart';
import '../../domain/usecases/get_favorites.dart';
import '../../domain/usecases/toggle_favorite.dart';

class FavoritesCubit extends Cubit<List<Anime>> {
  final GetFavorites getFavorites;
  final ToggleFavorite toggleFavoriteUseCase;

  FavoritesCubit(this.getFavorites, this.toggleFavoriteUseCase) : super([]);

  Future<void> loadFavorites() async {
    final data = await getFavorites(NoParams());
    emit(data);
  }

  Future<void> toggleFavorite(Anime anime) async {
    await toggleFavoriteUseCase(anime);
    await loadFavorites();
  }
}
