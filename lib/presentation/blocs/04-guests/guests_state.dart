part of 'guests_bloc.dart';

enum GuestsFilter {
  all,
  invited,
  notInvited,
}

class GuestsState extends Equatable {
  final GuestsFilter filter;
  final List<Todo> guests;

  const GuestsState({this.filter = GuestsFilter.all, this.guests = const []});

  GuestsState copyWith({
    GuestsFilter? filter,
    List<Todo>? guests,
  }) =>
      GuestsState(filter: filter ?? this.filter, guests: guests ?? this.guests);

  @override
  List<Object> get props => [filter, guests];
}
