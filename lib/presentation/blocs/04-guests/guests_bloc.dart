import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'package:blocs_app/domain/entities/todo.dart';
import 'package:blocs_app/config/config.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now().subtract(const Duration(days: 1))),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now().subtract(const Duration(days: 7))),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ])) {
    /* on<SetInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestsFilter.invited));
    });
    on<SetNotInvitedFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestsFilter.notInvited));
    });
    on<SetAllFilterEvent>((event, emit) {
      emit(state.copyWith(filter: GuestsFilter.all));
    }); */
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.customFilter));
    });
    on<AddGuestEvent>(_handleAddGuest);
  }

  void _handleAddGuest(AddGuestEvent event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.guestName, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void addGuest(String guestName) {
    add(AddGuestEvent(guestName));
  }

  void changeFilter(GuestsFilter filter) {
    add(SetCustomFilterEvent(filter));
    /* switch (filter) {
      case GuestsFilter.all:
        add(SetAllFilterEvent());
        break;

      case GuestsFilter.invited:
        add(SetInvitedFilterEvent());
        break;

      case GuestsFilter.notInvited:
        add(SetNotInvitedFilterEvent());
        break;
    } */
  }
}
