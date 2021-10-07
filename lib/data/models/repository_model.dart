import 'package:flutter_breaking_film/data/models/character_model.dart';

abstract class RepositoryModel {
  Future<List<CharacterModel>> getAllData();
}
