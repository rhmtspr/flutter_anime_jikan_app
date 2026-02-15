import 'package:anime_jikan_app/core/di/injection.dart';
import 'package:anime_jikan_app/features/anime/domain/repositories/anime_repository.dart';
import 'package:flutter/material.dart';

// 1. Change to StatefulWidget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 2. Add your initState here
  @override
  void initState() {
    super.initState();
    _testApi();
  }

  // 3. Add your private method inside the State class
  Future<void> _testApi() async {
    // Note: Ensure 'sl' and 'AnimeRepository' are imported/accessible
    final repo = sl<AnimeRepository>();
    final data = await repo.getTopAnime(1);
    print(data.first.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anime Explorer')),
      body: const Center(child: Text('Check your debug console!')),
    );
  }
}

// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Anime Explorer')),
//       body: const Center(
//         child: Text('Coming soon...'),
//       ),
//     );
//   }
// }
