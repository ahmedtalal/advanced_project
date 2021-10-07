part of 'characters_cubit.dart';

@immutable
abstract class CharactersStates {}

class CharactersInitialState extends CharactersStates {}

class CharactersLoadingState extends CharactersStates {}

class CharactersLoadedState extends CharactersStates {
  final List<CharacterModel> list;
  CharactersLoadedState({required this.list});
}

class CharactersExceptionState extends CharactersStates {
  final error;
  CharactersExceptionState({required this.error});
}
