import 'package:pokemon_app/domain/entities/pokemon_entity.dart';

class PokemonModel {
  final int id;
  final String name;
  final List<dynamic> abilities;
  final String specie;
  final String imageURL;
  final List<dynamic> types;

  PokemonModel({
    required this.id,
    required this.name,
    required this.abilities,
    required this.specie,
    required this.imageURL,
    required this.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json['id'],
        name: json["name"],
        abilities: json["abilities"],
        specie: json["species"]["name"],
        imageURL: json["sprites"]?["other"]?["official-artwork"]
            ?["front_default"],
        types: json["types"],
      );

  factory PokemonModel.fromEntity(PokemonEntity entity) => PokemonModel(
        id: entity.id,
        name: entity.name,
        abilities: entity.abilities,
        specie: entity.specie,
        imageURL: entity.imageURL,
        types: entity.types,
      );

  PokemonEntity toEntity() => PokemonEntity(
        id: id,
        name: name,
        abilities: abilities,
        specie: specie,
        imageURL: imageURL,
        types: types,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abilities": abilities,
        "specie": specie,
        "types": types
      };
}
