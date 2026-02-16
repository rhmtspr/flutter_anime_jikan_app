import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/anime_list_bloc.dart';
import '../widgets/anime_card.dart';
import 'anime_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AnimeListBloc bloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc = sl<AnimeListBloc>()..add(FetchAnime());
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      bloc.add(FetchAnime());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Anime Explorer')),
        body: BlocBuilder<AnimeListBloc, AnimeListState>(
          builder: (context, state) {
            if (state is AnimeListLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AnimeListError) {
              return Center(child: Text(state.message));
            }

            if (state is AnimeListLoaded) {
              return GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: state.hasReachedMax
                    ? state.anime.length
                    : state.anime.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.anime.length) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final anime = state.anime[index];

                  return AnimeCard(
                    anime: anime,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AnimeDetailPage(id: anime.id),
                        ),
                      );
                    },
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
