import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/data/models/character_model.dart';
import 'package:flutter_breaking_film/presentation/widgets/character_adapter_widget.dart';
import 'package:flutter_breaking_film/presentation/widgets/exception_widget.dart';
import 'package:flutter_breaking_film/presentation/widgets/loading_indicator_widget.dart';

class CharacterStateBuilderWidget extends StatelessWidget {
  final List<CharacterModel> characters;
  final String choosed;
  const CharacterStateBuilderWidget({
    Key? key,
    required this.characters,
    required this.choosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (choosed.toLowerCase()) {
      case "loading":
        return LoadingIndicatorWidget();
      case "loaded":
        if (characters.isNotEmpty) {
          return CharacterAdapterWidget(characterList: characters);
        } else {
          return ExceptionWidget(
            message: "No data at this time",
          );
        }
      case "error":
        return ExceptionWidget(
          message: "There are problems with your internet",
        );
      default:
        return LoadingIndicatorWidget();
    }
  }
}
