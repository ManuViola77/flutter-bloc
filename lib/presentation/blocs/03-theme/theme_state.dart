part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isDarkmode;

  const ThemeState({required this.isDarkmode});

  @override
  List<Object> get props => [isDarkmode];
}

// se podria hacer con distintas clases para cada estado
// pero despues hay que andar evaluando cual es
/* final class ThemeInitial extends ThemeState {}

final class ThemeDark extends ThemeState {}

final class ThemeLight extends ThemeState {} */
