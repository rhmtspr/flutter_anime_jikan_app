import 'package:anime_jikan_app/features/anime/presentation/bloc/favorites_cubit.dart';
import 'package:anime_jikan_app/features/anime/presentation/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: BlocBuilder<FavoritesCubit, Set<int>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(child: Text('No favorites yet ❤️'));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (_, index) {
              final animeId = favorites.elementAt(index);

              return ListTile(
                title: Text('Anime ID: $animeId'),
                trailing: FavoriteButton(animeId: animeId),
              );
            },
          );
        },
      ),
    );
  }
}
