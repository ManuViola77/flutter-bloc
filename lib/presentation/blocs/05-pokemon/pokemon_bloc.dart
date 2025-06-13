import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
    on<AddPokemonEvent>((event, emit) {
      emit(state.copyWith(
          pokemons: {...state.pokemons, event.pokemonId: event.pokemonName}));
    });
  }

  void addPokemon(int pokemonId) {
    final pokemonName = 'Pokemon $pokemonId';
    add(AddPokemonEvent(pokemonId, pokemonName));
  }
}
