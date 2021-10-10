import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/data/models/character_model.dart';
import 'package:flutter_breaking_film/presentation/widgets/character_viewer_widget.dart';

class CharacterAdapterWidget extends StatelessWidget {
  final List<CharacterModel> characterList;
  const CharacterAdapterWidget({
    Key? key,
    required this.characterList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: characterList.length,
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return CharacterViewerWidget(
          model: characterList[index],
        );
      },
    );
  }
}
