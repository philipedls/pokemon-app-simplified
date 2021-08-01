import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final String id;
  final String name;
  final List<String> abilities;
  final String specie;
  final String imageURL;
  final int weight;
  final int height;
  final List<String> types;

  PokemonEntity({
    required this.name,
    required this.id,
    required this.abilities,
    required this.specie,
    required this.imageURL,
    required this.weight,
    required this.height,
    required this.types,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, abilities, specie, imageURL, weight, height, types];
}
