import 'package:pokemon_app/domain/entities/pokemon_entity.dart';

abstract class LoadPokemon {
  Future<List<PokemonEntity>> load();
}
