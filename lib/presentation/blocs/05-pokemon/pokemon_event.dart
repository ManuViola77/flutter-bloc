part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class AddPokemonEvent extends PokemonEvent {
  final int pokemonId;
  final String pokemonName;

  const AddPokemonEvent(this.pokemonId, this.pokemonName);

  @override
  List<Object> get props => [pokemonId, pokemonName];
}
