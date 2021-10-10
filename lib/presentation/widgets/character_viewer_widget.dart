import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking_film/constants/colors_app.dart';
import 'package:flutter_breaking_film/constants/strings.dart';
import 'package:flutter_breaking_film/data/models/character_model.dart';
import 'package:flutter_breaking_film/presentation/screens/character_details_screen.dart';

class CharacterViewerWidget extends StatelessWidget {
  final CharacterModel model;
  const CharacterViewerWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen(characterModel: model),
          ),
        );
      },
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: ColorsApp.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Hero(
          tag: model.charId,
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsApp.whiteColor,
              ),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: model.image,
                placeholder: (context, url) => Image(
                  image: AssetImage(placeholderImage),
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
                errorWidget: (context, url, error) => Image(
                  image: AssetImage(
                    errorImage,
                  ),
                ),
              ),
            ),
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.bottomCenter,
              color: Colors.black54,
              child: Text(
                model.name,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: ColorsApp.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
