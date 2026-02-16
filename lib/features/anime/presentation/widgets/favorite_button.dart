import 'package:anime_jikan_app/features/anime/presentation/bloc/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final int animeId;

  const FavoriteButton({super.key, required this.animeId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, Set<int>>(
      builder: (context, favorites) {
        final isFav = favorites.contains(animeId);

        return IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            context.read<FavoritesCubit>().toggleFavorite(animeId);
          },
        );
      },
    );
  }
}
