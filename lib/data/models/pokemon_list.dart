class PokemonList {
  final String? previous;
  final String next;
  final List<dynamic> results;

  PokemonList({
    required this.previous,
    required this.next,
    required this.results,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        previous: json['previous'] ?? '',
        next: json['next'],
        results: json['results'],
      );
}
