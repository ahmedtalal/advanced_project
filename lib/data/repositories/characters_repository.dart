import 'package:flutter_breaking_film/data/models/api_services_model.dart';
import 'package:flutter_breaking_film/data/models/character_model.dart';
import 'package:flutter_breaking_film/data/models/repository_model.dart';

class CharactersRepository extends RepositoryModel {
  ApiServicesModel apiServicesModel;
  CharactersRepository({required this.apiServicesModel});

  @override
  Future<List<CharacterModel>> getAllData() async {
    final characters = await apiServicesModel.getAllCharacters();
    print(characters.length);
    return characters.map((character) => convertToModel(character)).toList();
  }

  CharacterModel convertToModel(var json) {
    return CharacterModel.fromJson(json);
  }
}
