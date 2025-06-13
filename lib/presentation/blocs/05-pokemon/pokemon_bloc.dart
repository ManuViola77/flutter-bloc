import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
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
      final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
      add(AddPokemonEvent(pokemonId, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Pokemon not found');
    }
  }
}
