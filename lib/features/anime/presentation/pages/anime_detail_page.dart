import 'package:anime_jikan_app/features/anime/presentation/widgets/favorite_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/injection.dart';
import '../../../anime/domain/usecases/get_anime_detail.dart';

class AnimeDetailPage extends StatefulWidget {
  final int id;

  const AnimeDetailPage({super.key, required this.id});

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  String? title;
  String? imageUrl;
  String? synopsis;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    final usecase = sl<GetAnimeDetail>();
    final (failure, data) = await usecase(widget.id);

    if (data != null) {
      setState(() {
        title = data.title;
        imageUrl = data.imageUrl;
        synopsis = data.synopsis;
        loading = false;
      });
    } else {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Detail'),
        actions: [FavoriteButton(animeId: widget.id)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(synopsis ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
