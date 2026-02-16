import 'package:anime_jikan_app/app.dart';
import 'package:anime_jikan_app/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/anime/data/models/favorite_anime_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register adapter
  Hive.registerAdapter(FavoriteAnimeModelAdapter());

  // Open box
  await Hive.openBox<FavoriteAnimeModel>('favorites');

  await initDependencies();

  runApp(const AnimeExplorerApp());
}
