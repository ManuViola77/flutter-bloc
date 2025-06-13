import 'package:bloc/bloc.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState()) {
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
