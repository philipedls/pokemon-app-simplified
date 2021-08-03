import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final List<dynamic> abilities;
  final String specie;
  final String imageURL;
  final List<dynamic> types;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.abilities,
    required this.specie,
    required this.imageURL,
    required this.types,
  });

  @override
  List<Object?> get props => [name, abilities, specie, imageURL, types];
}
