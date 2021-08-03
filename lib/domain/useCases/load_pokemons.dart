import 'package:pokemon_app/data/models/pokemon_list.dart';

abstract class LoadPokemons {
  Future<PokemonList> loadList();
}
