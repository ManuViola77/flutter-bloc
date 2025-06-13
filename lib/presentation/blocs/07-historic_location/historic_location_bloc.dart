import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc
    extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationState()) {
    on<NewLocationEvent>(_handleNewLocation);
  }

  void _handleNewLocation(
      NewLocationEvent event, Emitter<HistoricLocationState> emit) {
    emit(state.copyWith(locations: [...state.locations, event.location]));
  }
}
