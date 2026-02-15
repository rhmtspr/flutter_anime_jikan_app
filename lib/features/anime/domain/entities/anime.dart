import 'package:equatable/equatable.dart';

class Anime extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final double score;
  final String synopsis;

  const Anime({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.score,
    required this.synopsis,
  });

  @override
  List<Object?> get props => [id];
}
