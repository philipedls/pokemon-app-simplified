import 'package:mobx/mobx.dart';
import 'package:pokemon_app/data/models/pokemon_list.dart';
import 'package:pokemon_app/data/useCases/load_pokemon.dart';
import 'package:pokemon_app/data/useCases/local_pokemon_list.dart';
import 'package:pokemon_app/domain/entities/pokemon_entity.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  PokemonList? listReponse;
  List<PokemonEntity> _pokemons = [];

  Future<List<PokemonEntity>>? pokemonsFuture;

  @observable
  bool loadMore = false;

  @action
  void onChangeLoadMode(bool value) => loadMore = value;

  Future<PokemonList?> _fetchMorePokemons(String path) async {
    String route = path.split('?')[1];
    LocalLoadPokemonList loadPokemon =
        new LocalLoadPokemonList(route: '/?$route');
    listReponse = await loadPokemon.loadList();
    return listReponse;
  }

  Future<PokemonList?> _fetchPokemons() async {
    LocalLoadPokemonList loadPokemon = new LocalLoadPokemonList(route: '/');
    listReponse = await loadPokemon.loadList();
    return listReponse;
  }

  Future<List<PokemonEntity>> _pokemonsListed(PokemonList? pokemonList) async {
    if (pokemonList != null) {
      for (dynamic entity in pokemonList.results) {
        LocalLoadPokemon loadPokemon =
            new LocalLoadPokemon(route: '/${entity['name']}');
        PokemonEntity pokemon = await loadPokemon.load();

        _pokemons.add(pokemon);
      }
    }

    return _pokemons;
  }

  Future<PokemonList?> _loadMorePokemons() {
    if (listReponse != null) {
      return _fetchMorePokemons(listReponse?.next ?? '');
    }

    return _fetchPokemons();
  }

  Future<List<PokemonEntity>?> onLoadedPokemons() async {
    var pokemonListed = await _loadMorePokemons();
    pokemonsFuture = _pokemonsListed(pokemonListed);

    return pokemonsFuture;
  }
}
