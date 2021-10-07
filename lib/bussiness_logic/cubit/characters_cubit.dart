import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking_film/data/models/character_model.dart';
import 'package:flutter_breaking_film/data/models/repository_model.dart';
import 'package:meta/meta.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersStates> {
  final RepositoryModel repositoryModel;
  CharactersCubit({
    required this.repositoryModel,
  }) : super(CharactersInitialState());

  static CharactersCubit getInstance(BuildContext context) {
    return BlocProvider.of<CharactersCubit>(context);
  }

  getCharacters() {
    emit(CharactersLoadingState());
    try {
      repositoryModel.getAllData().then((characters) {
        emit(CharactersLoadedState(list: characters));
      }).onError((error, stackTrace) {
        emit(CharactersExceptionState(error: error.toString()));
      });
    } catch (e) {
      emit(CharactersExceptionState(error: e.toString()));
    }
  }
}
