import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int pokemonId) _fetchPokemonName;

  PokemonBloc({required Future<String> Function(int pokemonId) fetchPokemon})
      : _fetchPokemonName = fetchPokemon,
        super(const PokemonState()) {
    on<AddPokemonEvent>((event, emit) {
      final newPokemons = Map<int, String>.from(state.pokemons);
      newPokemons[event.pokemonId] = event.pokemonName;
      emit(state.copyWith(pokemons: newPokemons));
    });
  }

  Future<String> addPokemon(int pokemonId) async {
    if (state.pokemons.containsKey(pokemonId)) {
      return state.pokemons[pokemonId]!;
    }

    try {
      final pokemonName = await _fetchPokemonName(pokemonId);
      add(AddPokemonEvent(pokemonId, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Pokemon not found');
    }
  }
}
