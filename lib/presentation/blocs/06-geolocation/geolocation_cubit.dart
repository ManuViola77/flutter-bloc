import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  GeolocationCubit() : super(const GeolocationState());

  Future<void> checkStatus() async {
    // Verificar Geolocation y Permissions
  }

  void watchUserLocation() {
    // Obtener la ubicacion del usuario
  }
}
