import 'package:pokemon_app/data/http/http_adapter.dart';
import 'package:pokemon_app/data/models/pokemon_dart.dart';
import 'package:pokemon_app/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/domain/useCases/load_pokemon.dart';

class LocalLoadPokemon implements LoadPokemon {
  final String route;
  final HttpAdapter client;

  LocalLoadPokemon({
    required this.route,
  }) : client = HttpAdapter();

  @override
  Future<PokemonEntity> load() async {
    try {
      final jsonReponse =
          await client.request(route: route, type: 'specific-pokemon');
      return PokemonModel.fromJson(jsonReponse).toEntity();
    } catch (error) {
      print(error);
      throw Exception();
    }
  }
}
