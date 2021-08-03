import 'package:pokemon_app/data/http/http_adapter.dart';
import 'package:pokemon_app/data/models/pokemon_list.dart';
import 'package:pokemon_app/domain/useCases/load_pokemons.dart';

class LocalLoadPokemonList implements LoadPokemons {
  final String route;
  final HttpAdapter client;

  LocalLoadPokemonList({
    required this.route,
  }) : client = HttpAdapter();

  @override
  Future<PokemonList> loadList() async {
    try {
      final jsonReponse = await client.request(route: route);
      return PokemonList.fromJson(jsonReponse);
    } catch (error) {
      print(error);
      throw 'Exception';
    }
  }
}
