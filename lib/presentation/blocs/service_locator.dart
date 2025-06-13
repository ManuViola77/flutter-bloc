import 'package:get_it/get_it.dart';

import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  // si se precisara podria pasar parametros de uno a otro
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(PokemonBloc());
}
