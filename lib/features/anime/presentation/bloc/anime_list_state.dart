part of 'anime_list_bloc.dart';

abstract class AnimeListState {}

class AnimeListInitial extends AnimeListState {}

class AnimeListLoading extends AnimeListState {}

class AnimeListLoaded extends AnimeListState {
  final List<Anime> anime;
  final bool hasReachedMax;

  AnimeListLoaded({required this.anime, required this.hasReachedMax});
}

class AnimeListError extends AnimeListState {
  final String message;
  AnimeListError(this.message);
}
